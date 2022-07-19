//
//  String+BuildInfo.swift
//  TimesTables
//
//  Created by Yash Shah on 16/07/2022.
//

import Foundation

enum Constants {
	static var appVersion = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String ?? ""
}
