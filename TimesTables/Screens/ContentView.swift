//
//  GameView.swift
//  TimesTables
//
//  Created by Yash Shah on 16/07/2022.
//

import SwiftUI

struct GameView: View {
	// swiftlint:disable:next identifier_name
	@EnvironmentObject var vm: TimesTablesViewModel

	var body: some View {
		VStack {
			CustomTopBarView()

			(Text("Score: ").bold() + Text(vm.score, format: .number))
				.font(.title2)

			Spacer()

			QuestionCardView(num1: vm.lhsNum, num2: vm.rhsNum)

			Spacer()

			VStack(spacing: 10) {
				ForEach(vm.possibleAnswers, id: \.self) { ans in
					AnswerCardView(value: ans)
				}
			}
		}
		.onAppear(perform: vm.askQuestion)
		.sheet(isPresented: $vm.isShowingSettings) {
			SettingsView()
		}
	}
}

struct GameView_Previews: PreviewProvider {
	static var previews: some View {
		GameView()
			.preferredColorScheme(.dark)
			.environmentObject(TimesTablesViewModel())
	}
}
