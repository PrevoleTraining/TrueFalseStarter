//
//  GameEngine.swift
//  TrueFalseStarter
//
//  Created by lprevost on 05.12.17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

class GameEngine {
    let numberOfQuestions: Int
    
    var questionProvider: QuestionProvider
    
    var currentQuestion: Question!
    
    var questionsAsked: Int = 0
    var correctAnswers: Int = 0
    
    init(numberOfQuestions: Int) {
        self.numberOfQuestions = numberOfQuestions
        questionProvider = QuestionProvider()
    }
    
    func nextQuestion() -> Question {
        currentQuestion = questionProvider.randomQuestion()
        return currentQuestion
    }
    
    func hasMoreQuestions() -> Bool {
        return questionsAsked < numberOfQuestions && questionProvider.areQuestionsAvailable()
    }
    
    ///
    /// Answer the question and manage the game statistics
    ///
    func answerQuestion(with answer: Int) -> Bool {
        questionsAsked += 1
        
        if isValidAnswer(with: answer) {
            correctAnswers += 1
            return true
        } else {
            return false
        }
    }
    
    ///
    /// Check if the answer is valid or not
    ///
    func isValidAnswer(with answer: Int) -> Bool {
        return answer == currentQuestion.validAnswer
    }
    
    func reset() {
        questionProvider = QuestionProvider()
        currentQuestion = nextQuestion()
        questionsAsked = 0
        correctAnswers = 0
    }
}
