//
//  CustomTopBarView.swift
//  TimesTables
//
//  Created by Yash Shah on 16/07/2022.
//

import SwiftUI

struct CustomTopBarView: View {
	// swiftlint:disable:next identifier_name
	@ObservedObject var vm: TimesTablesViewModel

	var body: some View {
		HStack {
			Button(action: vm.reset) {
				Image(systemName: "arrow.counterclockwise")
			}.buttonStyle(.gradient)

			Spacer(minLength: 0)

			Text("Times Tables")
				.font(.title.weight(.semibold))

			Spacer(minLength: 0)

			Button {
				vm.isShowingSettings = true
			} label: {
				Image(systemName: "gearshape")
			}.buttonStyle(.gradient)
		}
		.padding([.horizontal, .bottom])
	}
}

struct CustomTopBarView_Previews: PreviewProvider {
	static var previews: some View {
		CustomTopBarView(vm: .init())
			.previewLayout(.sizeThatFits)
			.preferredColorScheme(.dark)
	}
}
