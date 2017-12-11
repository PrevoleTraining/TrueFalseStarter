//
//  Question.swift
//  TrueFalseStarter
//
//  Created by PrevoleTraining on 05.12.17.
//  Copyright © 2017 PrevoleTraining. All rights reserved.
//

///
/// A question is compsed from a label that is used to ask the question to the user,
/// a collection of possible answers and the valid answer which is the index of the
/// answer into the answer choices.
///
class Question {
    let label: String
    let answerChoices: [String]
    let validAnswer: Int
    
    init(label: String, answerChoices: [String], validAnswer: Int) {
        self.label = label
        self.answerChoices = answerChoices
        self.validAnswer = validAnswer
    }
}
