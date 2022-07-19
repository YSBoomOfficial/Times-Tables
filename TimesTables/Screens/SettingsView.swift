//
//  SettingsView.swift
//  TimesTables
//
//  Created by Yash Shah on 16/07/2022.
//

import SwiftUI

struct SettingsView: View {
	// swiftlint:disable:next identifier_name
	@EnvironmentObject var vm: TimesTablesViewModel

	var body: some View {
		NavigationView {

			List {
				Section {
					VStack(alignment: .leading) {
						Text("From 1 times table to \(vm.maxTimesTableNum, format: .number) times table")
						Slider(
							value: $vm.maxTimesTableNum,
							in: 1...12, step: 1) {
								Text("What range of times tables do you want to practice?")
							} minimumValueLabel: {
								Text(1, format: .number)
							} maximumValueLabel: {
								Text(12, format: .number)
							} onEditingChanged: { _ in
								vm.askQuestion()
							}
					}

					Button(
						"Reset Game",
						role: .destructive,
						action: vm.reset
					)
				} header: {
					Text("Game Settings")
				}

				acboutSection
			}
			.listStyle(.insetGrouped)
			.navigationTitle("Settings")
		}
	}

	private var acboutSection: some View {
		Section {
			Label("Version \(Constants.appVersion)", systemImage: "app.badge")
		} header: {
			Text("About")
		} footer: {
			Text("Made with 🤍 by Yash")
		}
	}

}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView()
			.preferredColorScheme(.dark)
			.environmentObject(TimesTablesViewModel())
	}
}
