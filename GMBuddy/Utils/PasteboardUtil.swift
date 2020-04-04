//
//  PasteboardUtil.swift
//  GMBuddy
//
//  Created by Derek Yang on 2020-04-04.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import Foundation
import AppKit

struct PasteboardUtil {
	static func paste(_ text: String) {
		let pasteboard = NSPasteboard.general
		pasteboard.declareTypes([.string], owner: nil)
		pasteboard.setString(text, forType: .string)
	}
}
