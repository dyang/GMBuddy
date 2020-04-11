//
//  String.swift
//  GMBuddy
//
//  Created by Derek Yang on 2020-04-11.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import Foundation

extension String {
	func contains(substring: String) -> Bool {
		return self.range(of: substring, options: .caseInsensitive) != nil
	}
}
