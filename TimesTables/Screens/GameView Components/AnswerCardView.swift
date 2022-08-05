//
//  AnswerCardView.swift
//  TimesTables
//
//  Created by Yash Shah on 16/07/2022.
//

import SwiftUI

struct AnswerCardView: View {
	let proxy: GeometryProxy
	let value: Int

	let gradientColors: [Color] = [.red, .purple, .blue]
	let startPoint: UnitPoint = .topLeading
	let endPoint: UnitPoint = .bottomTrailing

	var body: some View {
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
					width: proxy.size.width - 10,
					height: (proxy.size.height/10)
				)

			Text(value, format: .number)
				.font(.largeTitle.weight(.semibold))
		}
	}
}

struct AnswerCardView_Previews: PreviewProvider {
	static var previews: some View {
		GeometryReader { proxy in
			VStack(spacing: 10) {
				Spacer()
				AnswerCardView(proxy: proxy, value: 1)
				AnswerCardView(proxy: proxy, value: 2)
				AnswerCardView(proxy: proxy, value: 3)
				AnswerCardView(proxy: proxy, value: 4)
			}
			.preferredColorScheme(.dark)
		}
	}
}
