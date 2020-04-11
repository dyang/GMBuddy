//
//  AppState.swift
//  GMBuddy
//
//  Created by Derek Yang on 2020-04-11.
//  Copyright © 2020 Derek Yang. All rights reserved.
//

import Foundation
import Combine

class AppState: ObservableObject {
	@Published var searchText: String = ""
}
