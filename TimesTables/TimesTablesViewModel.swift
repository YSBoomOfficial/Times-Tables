//
//  TimesTablesViewModel.swift
//  TimesTables
//
//  Created by Yash Shah on 16/07/2022.
//

import SwiftUI

class TimesTablesViewModel: ObservableObject {
	@Published private(set) var score = 0

	@Published private(set) var questionsAnswered = 0
	@Published private(set) var questionsAnsweredCorrectly = 0

	@Published var maxTimesTableNum = 12.0
	@Published private(set) var rhsNum: Int = 1
	@Published private(set) var lhsNum: Int = 1
	@Published private(set) var possibleAnswers = [Int]()
	private var correctAnswer = 0

	@Published var isShowingSettings = false

	func incrementScore() { score += 1 }

	func reset() {
		score = 0
		questionsAnswered = 0
		questionsAnsweredCorrectly = 0
		askQuestion()
	}

	func askQuestion() {
		possibleAnswers.removeAll(keepingCapacity: true)

		lhsNum = Int.random(in: 1...12)
		rhsNum = Int.random(in: 1...Int(maxTimesTableNum))

		correctAnswer = lhsNum * rhsNum
		possibleAnswers.append(correctAnswer)

		while possibleAnswers.count < 4 {
			let mult = Int.random(in: 1...12) * rhsNum
			if !(mult == correctAnswer) {
				possibleAnswers.append(mult)
			}
		}

		possibleAnswers.shuffle()
	}

	func answerButtonTapped(_ answer: Int) {
		questionsAnswered += 1
		if answer == correctAnswer {
			score += 1
			questionsAnsweredCorrectly += 1
		}
		askQuestion()
	}

}
