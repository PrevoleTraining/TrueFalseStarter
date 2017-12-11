//
//  Question.swift
//  TrueFalseStarter
//
//  Created by PrevoleTraining on 05.12.17.
//  Copyright © 2017 PrevoleTraining. All rights reserved.
//

import GameKit

///
/// A question is compsed from a label that is used to ask the question to the user,
/// a collection of possible answers and the valid answer which is the index of the
/// answer into the answer choices.
///
class Question {
    let label: String
    
    let originalChoices: [String]
    let originalValidAnswer: Int
    
    var answerChoices: [String] = []
    var validAnswer: Int = 0
    
    init(label: String, answerChoices: [String], validAnswer: Int) {
        self.label = label
        self.originalChoices = answerChoices
        self.originalValidAnswer = validAnswer
    }
    
    ///
    /// Randomize the answers ordering
    ///
    /// @return self
    ///
    func randomize() -> Question {
        var copyChoices = originalChoices
        
        // Mix the answer to be able to vary the answer order
        for i in 0..<originalChoices.count {
            let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: copyChoices.count)
            
            let choice = copyChoices.remove(at: randomNumber)
            answerChoices.append(choice)
            
            if choice == originalChoices[originalValidAnswer] {
                validAnswer = i
            }
        }
        
        return self
    }
}
