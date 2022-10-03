//
//  QuestionCardView.swift
//  TimesTables
//
//  Created by Yash Shah on 16/07/2022.
//

import SwiftUI

struct QuestionCardView: View {
	let proxy: GeometryProxy
	let num1: Int
	let num2: Int

	var gradientColors: [Color] = [.red, .purple, .blue]
	var startPoint: UnitPoint = .topLeading
	var endPoint: UnitPoint = .bottomTrailing

	var body: some View {
		backgroundRoundedRect
			.overlay {
				ZStack {
					roundedRectBorderShape
					cardContent
				}
			}
	}
}

struct QuestionCardView_Previews: PreviewProvider {
	static var previews: some View {
		GeometryReader { proxy in
			HStack {
				QuestionCardView(proxy: proxy, num1: 0, num2: 1)
			}
			.frame(maxWidth: .infinity, maxHeight: .infinity)
		}
		.preferredColorScheme(.dark)
	}
}

fileprivate extension QuestionCardView {
	var backgroundRoundedRect: some View {
		RoundedRectangle(cornerRadius: 10)
			.foregroundStyle(.ultraThinMaterial)
			.background(
				.linearGradient(
					colors: gradientColors,
					startPoint: startPoint,
					endPoint: endPoint
				),
				in: RoundedRectangle(cornerRadius: 10)
			)
			.frame(
				width: proxy.size.width - 35,
				height: proxy.size.height/3.75
			)
	}

	var roundedRectBorderShape: some View {
		RoundedRectangle(cornerRadius: 10)
			.strokeBorder(
				.linearGradient(
					colors: gradientColors,
					startPoint: endPoint,
					endPoint: startPoint
				),
				lineWidth: 2.5
			)
	}

	var cardContent: some View {
		VStack {
			Text("What is...")
				.font(.title.weight(.semibold))

			HStack(spacing: 20) {
				Text(num1, format: .number)
					.padding(8)
					.background(.background.opacity(0.25))
					.clipShape(RoundedRectangle(cornerRadius: 8))

				Image(systemName: "multiply")
					.font(.title.weight(.bold))

				Text(num2, format: .number)
					.padding(8)
					.background(.background.opacity(0.25))
					.clipShape(RoundedRectangle(cornerRadius: 8))

			}
			.font(.largeTitle.weight(.semibold))
		}
		.padding()

	}

}
