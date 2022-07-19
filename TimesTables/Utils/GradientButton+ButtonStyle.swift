//
//  GradientButton+ButtonStyle.swift
//  TimesTables
//
//  Created by Yash Shah on 16/07/2022.
//

import SwiftUI

struct GradientButton: ButtonStyle {
	var gradientColors: [Color] = [.red, .purple, .blue]
	var startPoint: UnitPoint = .topLeading
	var endPoint: UnitPoint = .bottomTrailing

	func makeBody(configuration: Configuration) -> some View {
		configuration.label
			.foregroundColor(.white)
			.padding(8)
			.background {
				if !configuration.isPressed {
					Circle()
						.foregroundStyle(
							.linearGradient(
								colors: gradientColors,
								startPoint: startPoint,
								endPoint: endPoint
							)
						)
						.opacity(0.5)
				} else {
					Circle()
						.foregroundStyle(
							.linearGradient(
								colors: gradientColors,
								startPoint: startPoint,
								endPoint: endPoint
							)
						)
						.opacity(0.35)
				}
			}
	}

}

extension ButtonStyle where Self == GradientButton {
	static var gradient: GradientButton { .init() }

	static func gradient(
		gradientColors: [Color] = [.red, .purple, .blue],
		startPoint: UnitPoint = .topLeading,
		endPoint: UnitPoint = .bottomTrailing
	) -> GradientButton {
		.init(
			gradientColors: gradientColors,
			startPoint: startPoint,
			endPoint: endPoint
		)
	}
}
