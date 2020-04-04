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
		GeometryReader { metrics in
			HStack() {
				Text(self.gitmoji.emoji)
					.font(Font.system(size: 36))
					.frame(width: metrics.size.width * 0.2)
				
				Text(self.gitmoji.description)
					.font(Font.system(size: 14))
					.frame(width: metrics.size.width * 0.6, alignment: .leading)
				
				Text(self.gitmoji.code)
					.font(Font.system(size: 18))
					.frame(width: metrics.size.width * 0.2)
			}
		}
	}
}


struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView(gitmojiController: GitmojiController())
	}
}
