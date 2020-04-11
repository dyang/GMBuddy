//
//  AppDelegate.swift
//  GMBuddy
//
//  Created by Derek Yang on 2020-03-15.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

	private let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.squareLength)
	private let gitmojiController = GitmojiController()
	private let popover = NSPopover()

	func applicationDidFinishLaunching(_ aNotification: Notification) {
		// Insert code here to initialize your application
		initStatusButton()
		initPopover()
		gitmojiController.load()
		NotificationCenter.default.addObserver(self, selector: #selector(dismissPopover), name: .dismissPopover, object: nil)
	}
	
	func applicationWillTerminate(_ aNotification: Notification) {
		// Insert code here to tear down your application
	}
	
	private func initStatusButton() {
		guard let button = statusItem.button else { return }
		button.image = NSImage(named: "g")
		button.image?.size = NSSize(width: 20, height: 20)
		button.action = #selector(togglePopover)
	}
	
	private func initPopover() {
		let contentController = ContentController(gitmojiController: gitmojiController)
		popover.contentViewController = contentController
	}
	
	@objc func togglePopover(_ sender: Any?) {
		if let button = statusItem.button {
			popover.togglePopover(sender, view: button)
		}
	}
	
	@objc func dismissPopover() {
		togglePopover(nil)
	}
}

