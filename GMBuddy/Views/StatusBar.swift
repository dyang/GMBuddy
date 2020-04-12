//
//  StatusBar.swift
//  GMBuddy
//
//  Created by Derek Yang on 2020-04-12.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import SwiftUI

struct StatusBar: View {
	var body: some View {
		HStack {
			Spacer()
			Button(action: {
				NSApplication.shared.terminate(self)
			}) {
				Text("Quit")
			}
			.buttonStyle(BorderlessButtonStyle())
		}
		.padding([.bottom, .trailing], 8)
	}
}
