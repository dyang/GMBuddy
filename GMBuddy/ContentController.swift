//
//  ContentController.swift
//  GMBuddy
//
//  Created by Derek Yang on 2020-03-15.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import Foundation
import Cocoa
import SwiftUI

class ContentController: NSViewController {
	override func loadView() {
		view = NSView()

        preferredContentSize = NSSize(width: 300, height: 460)

        let hostingController = NSHostingController(rootView: ContentView())
        hostingController.view.autoresizingMask = [.width, .height]
        hostingController.view.frame = view.bounds
		addChild(hostingController)
        
        view.addSubview(hostingController.view)
	}
}
