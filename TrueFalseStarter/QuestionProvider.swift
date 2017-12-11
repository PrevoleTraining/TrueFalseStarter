//
//  QuestionProvider.swift
//  TrueFalseStarter
//
//  Created by PrevoleTraining on 05.12.17.
//  Copyright © 2017 PrevoleTraining. All rights reserved.
//

import GameKit

///
/// The question provider class manage the question collection and
/// offer facilitators to choose a question randomly avoiding
/// duplicate questions
///
class QuestionProvider {
    /*
     * The list of questions
     * Set between two and four answer choices
     */
    let questions: [Question] = [
        Question(label: "Only female koalas can whistle", answerChoices: ["True", "False" ], validAnswer: 1),
        Question(label: "Blue whales are technically whales", answerChoices: ["True", "False"], validAnswer: 0),
        Question(label: "Camels are cannibalistic", answerChoices: ["True", "False", "Sure", "Not sure"], validAnswer: 1),
        Question(label: "All ducks are birds", answerChoices: ["True", "False", "Maybe"], validAnswer: 0)
    ]
    
    // The question currently selected
    var currentQuestions: [Question]
    
    init() {
        // Make a copy of initial questions to make it easy to remove questions avoiding asking a question twice
        currentQuestions = questions
    }
    
    ///
    /// Pick a question randomly with the warranty no question are chosen twice
    /// When there is no more questions available, an error is raised
    ///
    /// @return The chosen question
    ///
    func randomQuestion() -> Question {
        // Pick a question randomly and remove it from the questions to avoid picking a question twice
        let randomNumber = GKRandomSource.sharedRandom().nextInt(upperBound: currentQuestions.count)
        return currentQuestions.remove(at: randomNumber)
    }
    
    ///
    /// Get the number of questions regardless questions already been chosen
    ///
    /// @return The number of total questions
    ///
    func totalPossibleQuestions() -> Int {
        return questions.count
    }
    
    ///
    /// Check if there is available questions
    ///
    /// @return True if at least one question can be chosen randomly
    ///
    func areQuestionsAvailable() -> Bool {
        return !currentQuestions.isEmpty
    }
}
