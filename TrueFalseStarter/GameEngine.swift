//
//  GameEngine.swift
//  TrueFalseStarter
//
//  Created by lprevost on 05.12.17.
//  Copyright © 2017 Treehouse. All rights reserved.
//

class GameEngine {
    let questionProvider: QuestionProvider
    
    let numberOfQuestions: Int
    
    var currentQuestion: Question
    
    var questionsAsked: Int = 0
    var correctAnswers: Int = 0
    
    init(numberOfQuestions: Int) {
        self.numberOfQuestions = numberOfQuestions
        
        questionProvider = QuestionProvider()
        currentQuestion = questionProvider.randomQuestion()
    }
    
    func nextQuestion() -> Question {
        currentQuestion = questionProvider.randomQuestion()
        return currentQuestion
    }
    
    func hasMoreQuestions() -> Bool {
        return questionsAsked < numberOfQuestions
    }
    
    func answerQuestion(with answer: Int) -> Bool {
        questionsAsked += 1
        
        if answer == currentQuestion.answer {
            correctAnswers += 1
            return true
        } else {
            return false
        }
    }
    
    func reset() {
        currentQuestion = nextQuestion()
        questionsAsked = 0
        correctAnswers = 0
    }
}
