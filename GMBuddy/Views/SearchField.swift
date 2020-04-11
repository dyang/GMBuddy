//
//  SearchField.swift
//  GMBuddy
//
//  Created by Derek Yang on 2020-04-11.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import SwiftUI

struct SearchField: NSViewRepresentable {
	@Binding var text: String
	
	init(_ text: Binding<String>) {
		_text = text
	}
	
	func makeNSView(context: Context) -> NSSearchField {
		let searchField = NSSearchField(string: text)
		searchField.delegate = context.coordinator
		searchField.focusRingType = .none
		searchField.bezelStyle = .roundedBezel
		return searchField
	}
	
	func makeCoordinator() -> Coordinator {
		Coordinator(binding: $text)
	}
	
	func updateNSView(_ nsView: NSSearchField, context: Context) {
		nsView.stringValue = text
	}
	
	class Coordinator: NSObject, NSSearchFieldDelegate {
		let binding: Binding<String>
		
		init(binding: Binding<String>) {
			self.binding = binding
			super.init()
		}
		
		func controlTextDidChange(_ obj: Notification) {
			guard let field = obj.object as? NSTextField else { return }
			binding.wrappedValue = field.stringValue
		}
	}
}
