//
//  SettingsView.swift
//  TimesTables
//
//  Created by Yash Shah on 16/07/2022.
//

import SwiftUI

struct SettingsView: View {
	private let linksUrl = URL(string: "https://linktr.ee/YSBoomOfficial")!
	private let repoURL = URL(string: "https://github.com/ysBoomOfficial/times-Tables/")!

	// swiftlint:disable:next identifier_name
	@ObservedObject var vm: TimesTablesViewModel

	var body: some View {
		NavigationView {
			List {
				gameSettingsSection

				aboutSection
			}
			.listStyle(.insetGrouped)
			.navigationTitle("Settings")
		}
	}

	private var gameSettingsSection: some View {
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
	}

	private var aboutSection: some View {
		Section {
			Label(
				"Version \(Bundle.main.releaseVersionNumber!).\(Bundle.main.buildVersionNumber!)",
				systemImage: "app.badge"
			)

			Link(destination: repoURL) {
				VStack(alignment: .leading) {
					Text("Wanna take a peak at the code? ")
						.foregroundColor(.primary)
					Text("Here's the GitHub repo")
				}
			}
		} header: {
			Text("About The App")
		} footer: {
			Text("Made with 🤍 by Yash")
		}
	}

}

struct SettingsView_Previews: PreviewProvider {
	static var previews: some View {
		SettingsView(vm: .init())
			.preferredColorScheme(.dark)
			.environmentObject(TimesTablesViewModel())
	}
}
