//
//  TimesTablesApp.swift
//  TimesTables
//
//  Created by Yash Shah on 16/07/2022.
//

import SwiftUI

@main
struct TimesTablesApp: App {
	// swiftlint:disable:next identifier_name
	@StateObject private var vm = TimesTablesViewModel()
    var body: some Scene {
        WindowGroup {
			GameView()
				.environmentObject(vm)
				.onAppear {
					// MARK: Uncomment before prod
					// AppReviewRequest.requestReviewIfNeeded()
				}
        }
    }
}
