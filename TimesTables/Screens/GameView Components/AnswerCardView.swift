//
//  AnswerCardView.swift
//  TimesTables
//
//  Created by Yash Shah on 16/07/2022.
//

import SwiftUI

struct AnswerCardView: View {
	// swiftlint:disable:next identifier_name
	@EnvironmentObject var vm: TimesTablesViewModel

	let value: Int

	var gradientColors: [Color] = [.red, .purple, .blue]
	var startPoint: UnitPoint = .topLeading
	var endPoint: UnitPoint = .bottomTrailing

	var body: some View {
		Button {
			vm.answerButtonTapped(value)
		} label: {
			ZStack {
				Capsule()
					.strokeBorder(
						.linearGradient(
							colors: gradientColors,
							startPoint: startPoint,
							endPoint: endPoint
						),
						style: .init(lineWidth: 5)
					)
					.frame(
						width: ScreenSize.minLength - 10,
						height: (ScreenSize.maxLength/10)
					)

				Text(value, format: .number)
					.font(.largeTitle.weight(.semibold))
			}
		}.buttonStyle(.plain)
	}
}

struct AnswerCardView_Previews: PreviewProvider {
	static var previews: some View {
		VStack(spacing: 10) {
			Spacer()
			AnswerCardView(value: 1)
			AnswerCardView(value: 2)
			AnswerCardView(value: 3)
			AnswerCardView(value: 4)
		}
		.preferredColorScheme(.dark)
		.environmentObject(TimesTablesViewModel())
	}
}
