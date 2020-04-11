//
//  ContentView.swift
//  GMBuddy
//
//  Created by Derek Yang on 2020-03-15.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	@ObservedObject var appState: AppState
	@ObservedObject var gitmojiController: GitmojiController
	
	var body: some View {
		VStack {
			SearchField(text: $appState.searchText)
				.padding([.top, .leading, .trailing], 8)
			List(gitmojiController.gitmojis) { gitmoji in
				ItemView(gitmoji: gitmoji)
					.frame(minHeight: 40)
			}
		}
		.padding(0)
	}
}

struct ItemView: View {
	var gitmoji: Gitmoji
	
	var body: some View {
		HStack() {
			Text(self.gitmoji.emoji)
				.font(Font.system(size: 36))
				.frame(width: 50)
			
			Text(self.gitmoji.code + " " + self.gitmoji.description)
				.font(Font.system(size: 14))
				.frame(alignment: .leading)
			
			Spacer()
		}
		.onTapGesture {
			self.onEmojiTapped()
		}
	}
	
	func onEmojiTapped() {
		PasteboardUtil.paste(self.gitmoji.code)
		NotificationCenter.default.post(name: .dismissPopover, object: nil)
	}
}


struct ContentView_Previews: PreviewProvider {
	static let state = AppState()
	static var previews: some View {
		ContentView(appState: state,
					gitmojiController: GitmojiController(appState: state))
	}
}
