//
//  QuestionCardView.swift
//  TimesTables
//
//  Created by Yash Shah on 16/07/2022.
//

import SwiftUI

struct QuestionCardView: View {
	// swiftlint:disable:next identifier_name
	@EnvironmentObject var vm: TimesTablesViewModel

	let num1: Int
	let num2: Int

	var gradientColors: [Color] = [.red, .purple, .blue]
	var startPoint: UnitPoint = .topLeading
	var endPoint: UnitPoint = .bottomTrailing

	var body: some View {
		ZStack {
			RoundedRectangle(cornerRadius: 10)
				.foregroundStyle(.ultraThinMaterial)
				.background(
					.linearGradient(
						colors: gradientColors,
						startPoint: startPoint,
						endPoint: endPoint
					)
				)
				.frame(
					width: ScreenSize.minLength - 35,
					height: ScreenSize.maxLength/3.75
				)
				.clipShape(RoundedRectangle(cornerRadius: 10))

			VStack {
				Text("What is...")
					.font(.title.weight(.semibold))

				HStack(spacing: 20) {
					Text(num1, format: .number)
						.padding(8)
						.background(.thinMaterial)
						.clipShape(RoundedRectangle(cornerRadius: 8))

					Image(systemName: "multiply")
						.font(.title.weight(.bold))

					Text(num2, format: .number)
						.padding(8)
						.background(.thinMaterial)
						.clipShape(RoundedRectangle(cornerRadius: 8))

				}
				.font(.largeTitle.weight(.semibold))
			}
			.padding()
		}

	}
}

struct QuestionCardView_Previews: PreviewProvider {
	static var previews: some View {
		QuestionCardView(num1: 0, num2: 1)
			.preferredColorScheme(.dark)
			.environmentObject(TimesTablesViewModel())
	}
}
