//
//  ContentView.swift
//  GMBuddy
//
//  Created by Derek Yang on 2020-03-15.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
	
	var gitmojiController: GitmojiController
	
	var body: some View {
		List(gitmojiController.gitmojis) { gitmoji in
			ItemView(gitmoji: gitmoji)
				.frame(height: 40)
		}
		.padding()
	}
}

struct ItemView: View {
	var gitmoji: Gitmoji
	
	var body: some View {
		HStack() {
			Text(self.gitmoji.emoji)
				.font(Font.system(size: 36))
			
			Text(self.gitmoji.code + " " + self.gitmoji.description)
				.font(Font.system(size: 14))
				.frame(minWidth: 60, alignment: .leading)
			Spacer()
		}
		.onTapGesture {
			PasteboardUtil.paste(self.gitmoji.code)
		}
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(gitmojiController: GitmojiController())
	}
}
