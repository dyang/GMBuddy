//
//  GitmojiController.swift
//  GMBuddy
//
//  Created by Derek Yang on 2020-03-15.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

class GitmojiController: ObservableObject {
	@Published var gitmojis: [Gitmoji] = []
	@ObservedObject var appState: AppState
	
	private var __gitmojis: [Gitmoji] = []
	private var cancellable: AnyCancellable?
	private var searchCancellable: AnyCancellable?
	private var foo: AnyCancellable?
	private let gitmojisUrl = "https://raw.githubusercontent.com/carloscuesta/gitmoji/master/src/data/gitmojis.json"
	private let searchQueue = DispatchQueue(label: "GMBuddy_Search")
	
	init(appState: AppState) {
		self.appState = appState
		
		searchCancellable = appState.$searchText
			.debounce(for: 0.4, scheduler: searchQueue)
			.eraseToAnyPublisher()
			.sink(receiveValue: { [weak self] value in
				if let self = self {
					self.gitmojis = self.filter(value)
				}
			})
	}
	
	func load() {
		guard let url = URL(string: gitmojisUrl) else { fatalError("Boom!") }
		
		cancellable = URLSession.shared.dataTaskPublisher(for: url)
			.map { $0.data }
			.decode(type: [String: [Gitmoji]].self, decoder: JSONDecoder())
			.replaceError(with: ["gitmojis": []])
			.eraseToAnyPublisher()
			.sink(receiveValue: { [weak self] gitmojis in
				guard let self = self else { return }
				self.__gitmojis = gitmojis["gitmojis"] ?? []
				self.gitmojis = self.filter("")
			})
	}
	
	private func filter(_ text: String) -> [Gitmoji] {
		if text.count == 0 { return __gitmojis }
		return __gitmojis.filter { $0.code.contains(substring: text) || $0.description.contains(substring: text) }
	}
}
