//
//  QuestionProvider.swift
//  TrueFalseStarter
//
//  Created by lprevost on 05.12.17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

import GameKit

class QuestionProvider {
    let questions: [Question] = [
        Question(label: "Only female koalas can whistle", answerChoices: ["True", "False" ], validAnswer: 1),
        Question(label: "Blue whales are technically whales", answerChoices: ["True", "False"], validAnswer: 0),
        Question(label: "Camels are cannibalistic", answerChoices: ["True", "False", "Sure", "Not sure"], validAnswer: 1),
        Question(label: "All ducks are birds", answerChoices: ["True", "False", "Maybe"], validAnswer: 0)
    ]
    
    var currentQuestions: [Question]
    
    init() {
        currentQuestions = questions
    }
    
    func randomQuestion() -> Question {
        // Pick a question randomly and remove it from the questions to avoid picking a question twice
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: currentQuestions.count)
        return currentQuestions.remove(at: randomNumber)
    }
    
    func areQuestionsAvailable() -> Bool {
        return !currentQuestions.isEmpty
    }
}
