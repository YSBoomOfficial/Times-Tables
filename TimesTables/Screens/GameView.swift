//
//  GameView.swift
//  TimesTables
//
//  Created by Yash Shah on 16/07/2022.
//

import SwiftUI

struct GameView: View {
	// swiftlint:disable:next identifier_name
	@ObservedObject var vm: TimesTablesViewModel

	var body: some View {
		GeometryReader { proxy in
			VStack {
				CustomTopBarView(vm: vm)

				(Text("Score: ").bold() + Text(vm.score, format: .number))
					.font(.title2)

				Spacer()

				QuestionCardView(proxy: proxy, num1: vm.lhsNum, num2: vm.rhsNum)

				Spacer()

				VStack(spacing: 10) {
					ForEach(vm.possibleAnswers, id: \.self) { ans in
						AnswerCardView(
							proxy: proxy,
							value: ans
						).onTapGesture {
							vm.answerButtonTapped(ans)
						}
					}
				}
			}
			.onAppear(perform: vm.askQuestion)
		}
	}
}

struct GameView_Previews: PreviewProvider {
	static var previews: some View {
		GameView(vm: .init())
			.preferredColorScheme(.dark)
	}
}
