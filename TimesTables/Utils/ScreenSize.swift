//
//  Screen+Ext.swift
//  TimesTables
//
//  Created by Yash Shah on 16/07/2022.
//

import SwiftUI

enum ScreenSize {
	static let width: CGFloat = UIScreen.main.bounds.width
	static let height: CGFloat = UIScreen.main.bounds.height
	static let minLength = min(width, height)
	static let maxLength = max(width, height)
}
