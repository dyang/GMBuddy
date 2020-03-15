//
//  NSPopover.swift
//  GMBuddy
//
//  Created by Derek Yang on 2020-03-15.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import Cocoa

extension NSPopover {
	
	func togglePopover(_ sender: Any?, view: NSView) {
		if isShown {
			closePopover(sender)
		} else {
			showPopover(view)
		}
	}
	
	private func showPopover(_ view: NSView) {
		show(relativeTo: view.bounds, of: view, preferredEdge: .minY)
	}
	
	private func closePopover(_ sender: Any?) {
		performClose(sender)
	}
}

