//
//  Question.swift
//  TrueFalseStarter
//
//  Created by lprevost on 05.12.17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

class Question {
    let label: String
    let options: [String]
    let answer: Int
    
    init(label: String, options: [String], answer: Int) {
        self.label = label
        self.options = options
        self.answer = answer
    }
}
