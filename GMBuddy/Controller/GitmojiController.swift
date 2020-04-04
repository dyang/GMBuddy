//
//  GitmojiController.swift
//  GMBuddy
//
//  Created by Derek Yang on 2020-03-15.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import Foundation
import Combine

class GitmojiController: ObservableObject {
	@Published var gitmojis: [Gitmoji] = []
	private var cancellable: AnyCancellable?
	private let gitmojisUrl = "https://raw.githubusercontent.com/carloscuesta/gitmoji/master/src/data/gitmojis.json"
	
	func load() {
		guard let url = URL(string: gitmojisUrl) else { fatalError("Boom!") }
		
		cancellable = URLSession.shared.dataTaskPublisher(for: url)
			.map { $0.data }
			.decode(type: [String: [Gitmoji]].self, decoder: JSONDecoder())
			.replaceError(with: ["gitmojis": []])
			.eraseToAnyPublisher()
			.sink(receiveValue: { gitmojis in
				self.gitmojis = gitmojis["gitmojis"] ?? []
			})
	}
}
