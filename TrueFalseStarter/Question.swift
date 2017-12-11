//
//  Question.swift
//  TrueFalseStarter
//
//  Created by lprevost on 05.12.17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

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
