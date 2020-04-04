//
//  Gitmoji.swift
//  GMBuddy
//
//  Created by Derek Yang on 2020-03-15.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import Foundation

struct Gitmoji: Codable, Identifiable {
	var id: String { name }
	var emoji: String
	var code: String
	var description: String
	var name: String
}

struct Gitmojis: Codable {
	var gitmoji: [Gitmoji]
}
