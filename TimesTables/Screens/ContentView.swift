//
//  ContentView.swift
//  Times Tables
//
//  Created by Yash Shah on 05/08/2022.
//

import SwiftUI

struct ContentView: View {
	// swiftlint:disable:next identifier_name
	@StateObject private var vm = TimesTablesViewModel()

	var body: some View {
		GameView(vm: vm)
			.sheet(isPresented: $vm.isShowingSettings) {
				SettingsView(vm: vm)
			}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
			.preferredColorScheme(.dark)
	}
}
