//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit
import AudioToolbox

class ViewController: UIViewController {
    
    var gameSound: SystemSoundID = 0
    
    // TODO: Replace this magic number by proper constant
    let gameEngine = GameEngine(numberOfQuestions: 4)
    
    @IBOutlet weak var questionField: UILabel!
    
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var fourthAnswerButton: UIButton!
    
    @IBOutlet weak var playAgainButton: UIButton!
    @IBOutlet weak var playAgainButtonView: UIView!

    var answerButtons: [UIButton] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadGameStartSound()
        
        answerButtons = [
            firstAnswerButton,
            secondAnswerButton,
            thirdAnswerButton,
            fourthAnswerButton
        ]
        
        hideAnswerButtons()
        
        playGameStartSound()
        
        displayQuestion()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func displayQuestion() {
        playAgainButtonView.isHidden = true

        let question: Question = gameEngine.nextQuestion()
        questionField.text = question.label
        
        for choiceIdx in 0..<question.answerChoices.count {
            let btn = answerButtons[choiceIdx]
            btn.setTitle(question.answerChoices[choiceIdx], for: UIControlState.normal)
            btn.isHidden = false
        }
    }
    
    func displayScore() {
        hideAnswerButtons()
        
        // Display play again button
        playAgainButtonView.isHidden = false
        
        questionField.text = "Way to go!\nYou got \(gameEngine.correctAnswers) out of \(gameEngine.numberOfQuestions) correct!"
    }
   
    func hideAnswerButtons() {
        // Show the answer buttons
        for btn in answerButtons {
            btn.isHidden = true
        }
    }
    
    @IBAction func checkAnswer(_ sender: UIButton) {
        var isAnswerCorrect: Bool
        
        switch (sender) {
            case firstAnswerButton: isAnswerCorrect = gameEngine.answerQuestion(with: 0)
            case secondAnswerButton: isAnswerCorrect = gameEngine.answerQuestion(with: 1)
            case thirdAnswerButton: isAnswerCorrect = gameEngine.answerQuestion(with: 2)
            case fourthAnswerButton: isAnswerCorrect = gameEngine.answerQuestion(with: 3)
            default: isAnswerCorrect = false
        }
        
        if (isAnswerCorrect) {
            questionField.text = "Correct!"
        } else {
            questionField.text = "Sorry, wrong answer!"
        }
        
        loadNextRoundWithDelay(seconds: 2)
    }
    
    func nextRound() {
        if gameEngine.hasMoreQuestions() {
            // Continue game
            displayQuestion()
        } else {
            // Game is over
            displayScore()
        }
    }
    
    @IBAction func playAgain() {
        hideAnswerButtons()
        
        gameEngine.reset()
        
        nextRound()
    }

    // MARK: Helper Methods
    
    func loadNextRoundWithDelay(seconds: Int) {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        // Calculates a time value to execute the method given current time and delay
        let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
        
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
            self.nextRound()
        }
    }
    
    func loadGameStartSound() {
        let pathToSoundFile = Bundle.main.path(forResource: "GameSound", ofType: "wav")
        let soundURL = URL(fileURLWithPath: pathToSoundFile!)
        AudioServicesCreateSystemSoundID(soundURL as CFURL, &gameSound)
    }
    
    func playGameStartSound() {
        AudioServicesPlaySystemSound(gameSound)
    }
}

