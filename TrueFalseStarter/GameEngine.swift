//
//  GameEngine.swift
//  TrueFalseStarter
//
//  Created by PrevoleTraining on 05.12.17.
//  Copyright © 2017 PrevoleTraining. All rights reserved.
//

///
/// The game engine manage the game metrics and brings the business
/// logic to the view.
///
class GameEngine {
    let numberOfQuestions: Int
    let winThreshold: Double
    
    var questionProvider: QuestionProvider
    
    var currentQuestion: Question!
    
    var questionsAsked: Int = 0
    var correctAnswers: Int = 0
    
    init(numberOfQuestions: Int, winThreshold: Double) {
        self.questionProvider = QuestionProvider(numberOfQuestions: numberOfQuestions)
        self.numberOfQuestions = numberOfQuestions
        self.winThreshold = winThreshold
    }
    
    ///
    /// Move to the next question
    ///
    /// @return The next question
    ///
    func nextQuestion() -> Question {
        currentQuestion = questionProvider.randomQuestion()
        return currentQuestion
    }
    
    ///
    /// Check if there is more questions to ask
    ///
    /// @return True if there is at least one more question
    func hasMoreQuestions() -> Bool {
        return questionsAsked < numberOfQuestions && questionProvider.areQuestionsAvailable()
    }
    
    ///
    /// Answer the question and manage the game statistics
    ///
    /// @param answer The answer given by the user
    /// @return True if the question was correctly answered
    func answerQuestion(with answer: Int) -> Bool {
        // Update the metrics
        questionsAsked += 1
        
        if isValidAnswer(with: answer) {
            correctAnswers += 1
            return true
        } else {
            return false
        }
    }
    
    ///
    /// Force a question to be failed
    ///
    func failQuestion() {
        questionsAsked += 1
    }
    
    ///
    /// Check if the answer is valid or not
    ///
    /// @param with Check if the a specific answer is correct or not
    /// @return True if the answer is correct for the current question
    ///
    func isValidAnswer(with answer: Int) -> Bool {
        return answer == currentQuestion.validAnswer
    }
    
    ///
    /// Check if the current game is a victory or a failure
    ///
    /// @return True if the game is finished and more than threshold questions are correctly answered
    ///
    func isVictory() -> Bool {
        return Double(correctAnswers) / Double(numberOfQuestions) * 100.0 >= winThreshold
    }
    
    ///
    /// Reset the game engine to start a new game
    ///
    func reset() {
        questionProvider = QuestionProvider(numberOfQuestions: numberOfQuestions)
        currentQuestion = nil
        questionsAsked = 0
        correctAnswers = 0
    }
}
