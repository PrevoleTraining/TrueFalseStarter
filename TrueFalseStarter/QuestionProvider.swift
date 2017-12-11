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
        Question(label: "Camels are cannibalistic", answerChoices: ["True", "False"], validAnswer: 1),
        Question(label: "All ducks are birds", answerChoices: ["True", "False", "Maybe"], validAnswer: 0)
    ]
    
    func randomQuestion() -> Question {
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: questions.count)
        return questions[randomNumber]
    }
}
