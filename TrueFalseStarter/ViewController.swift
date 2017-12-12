//
//  ViewController.swift
//  TrueFalseStarter
//
//  Created by Pasan Premaratne on 3/9/16.
//  Updated by PrevoleTraining on 5/12/16.
//  Copyright © 2016 Treehouse. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    let nextRoundDelay = 2

    // Colors for buttons and texts
    let wrongAnswerColor = UIColor(red: 199/255, green: 64/255, blue: 40/255, alpha: 1)
    let correctAnswerColor = UIColor(red: 30/255, green: 141/255, blue: 61/255, alpha: 1)
    let normalAnswerColor = UIColor(red: 12/255, green: 121/255, blue: 150/255, alpha: 1)
    
    // Colors for lightning progress bar
    let greenProgressColor = UIColor(red: 12/255, green: 187/255, blue: 6/255, alpha: 1)
    let orangeProgressColor = UIColor(red: 254/255, green: 90/255, blue: 29/255, alpha: 1)
    let redProgressColor = UIColor(red: 220/255, green: 20/255, blue: 60/255, alpha: 1)
    
    // Game engine
    let gameEngine = GameEngine(numberOfQuestions: 10, winThreshold: 60)
    
    // Sound engine
    let soundEngine = SoundEngine()
    
    // Collection of answer buttons. Easy to iterates on a collection.
    var answerButtons: [UIButton] = []
    
    // Game mode state
    var isLightningMode: Bool = false
    var lightningProgressTimer: Timer?
    
    // Lightning mode delays
    let lightningTimesupDelay = Float(15.0) // 15 seconds
    let lightningProgressInterval = Float(0.1) // 1/10 second
    var lightningProgressCountdownSlice = Float(1.0) // Default value, will be calculate in viewDidLoad: 1.0 / 15 / 1/10 -> 1.0 / 150.0
    
    // MARK: Controls

    @IBOutlet weak var questionField: UILabel!
    
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var fourthAnswerButton: UIButton!
    
    @IBOutlet weak var gameModesView: UIStackView!
    
    @IBOutlet weak var lightningTimesupProgressBar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lightningProgressCountdownSlice = Float(1.0) / (lightningTimesupDelay / lightningProgressInterval)
        
        // Welcome sound (Really?!? :)
        soundEngine.playSound(with: SoundName.startGame)
        
        // Keep track of all buttons in an indexed way
        answerButtons = [firstAnswerButton, secondAnswerButton, thirdAnswerButton, fourthAnswerButton]
        
        // First message to the user to start the game
        displayGameModes(with: "Choose which type of game you want to play")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    /**
     * Display the games mode allowing the user to chose between to game modes
     */
    func displayGameModes(with text: String, color: UIColor = UIColor.white) {
        lightningTimesupProgressBar.isHidden = true
        gameModesView.isHidden = false
        hideAnswerButtons()
        updateQuestionText(text: text, color: color)
    }
    
    /**
     * Display a question to the user
     */
    func displayQuestion() {
        // Hide all answer buttons before showing the required ones for the question
        hideAnswerButtons()
        
        // Retrieve the next question and update the text
        let question: Question = gameEngine.nextQuestion()
        updateQuestionText(text: question.label)
        
        // Show only the required answer buttons and set the answer text to the button
        for choiceIndex in 0..<question.answerChoices.count {
            let button = answerButtons[choiceIndex]
            button.setTitle(question.answerChoices[choiceIndex], for: UIControlState.normal)
            button.isEnabled = true
            button.tintColor = UIColor.white
            button.isHidden = false
        }
        
        // In lightning mode, start the progress bar and the timesup timer
        if isLightningMode {
            lightningTimesupProgressBar.progress = 1.0
            lightningTimesupProgressBar.isHidden = false
            lightningTimesupProgressBar.tintColor = greenProgressColor
            lightningProgressTimer = Timer.scheduledTimer(timeInterval: TimeInterval(lightningProgressInterval), target: self, selector: #selector(ViewController.updateProgressBar), userInfo: nil, repeats: true)
        }
    }
    
    /*
     * Display the scores. It also mean this is the end of a single game
     */
    func displayScore() {
        var gameEndingText: String
        var gameEndingColor: UIColor
        
        // Handle the text, color and sound depending the game state
        if gameEngine.isVictory() {
            soundEngine.playSound(with: SoundName.winPlay)
            gameEndingText = "Victory"
            gameEndingColor = correctAnswerColor
        } else {
            soundEngine.playSound(with: SoundName.losePlay)
            gameEndingText = "You loose"
            gameEndingColor = wrongAnswerColor
        }
        
        // Display the game modes with the appropriate message
        displayGameModes(with: "\(gameEndingText)!\nYou got \(gameEngine.correctAnswers) out of \(gameEngine.numberOfQuestions) correct!", color: gameEndingColor)
    }
   
    /*
     * Hide all the answer buttons
     */
    func hideAnswerButtons() {
        // Show the answer buttons
        for button in answerButtons {
            button.isHidden = true
            button.backgroundColor = normalAnswerColor
        }
    }
    
    /*
     * Update the UI to reflect the user answer to a question
     */
    func handleQuestionAnswered(isAnswerCorrect: Bool) {
        // First, hide the lightning progress bar
        lightningTimesupProgressBar.isHidden = true
        
        // Stop the progress bar timer work
        if isLightningMode && lightningProgressTimer!.isValid {
            lightningProgressTimer!.invalidate()
        }

        // Reflect the correctness of answers on the answer buttons (change btn color)
        for buttonIndex in 0..<answerButtons.count {
            answerButtons[buttonIndex].backgroundColor = gameEngine.isValidAnswer(with: buttonIndex) ? correctAnswerColor : wrongAnswerColor
        }
        
        // Play the correct sound depending the question answer
        soundEngine.playSound(with: isAnswerCorrect ? SoundName.correct : SoundName.wrong)
        
        // After the delay, start the next round
        loadNextRoundWithDelay(seconds: nextRoundDelay)
    }
    
    /*
     * Manage the passage to the next round
     */
    func nextRound() {
        if gameEngine.hasMoreQuestions() {
            // Continue game
            displayQuestion()
        } else {
            // Game is over
            displayScore()
        }
    }
    
    /**
     * Start a new game
     */
    func startGame() {
        soundEngine.playSound(with: SoundName.startPlay)

        gameModesView.isHidden = true
        gameEngine.reset()
        displayQuestion()
    }
    
    /*
     * Manage the action when the time is up to answer a question
     */
    func timesUp() {
        gameEngine.failQuestion()
        handleQuestionAnswered(isAnswerCorrect: false)
    }
    
    /*
     * UI Action to check if the user has correctly answered a question
     */
    @IBAction func checkAnswer(_ sender: UIButton) {
        for button in answerButtons {
            button.isEnabled = false
            button.tintColor = UIColor.black
        }
        
        var isAnswerCorrect: Bool
        
        // Retrieve the answer from user
        switch sender {
            case firstAnswerButton: isAnswerCorrect = gameEngine.answerQuestion(with: 0)
            case secondAnswerButton: isAnswerCorrect = gameEngine.answerQuestion(with: 1)
            case thirdAnswerButton: isAnswerCorrect = gameEngine.answerQuestion(with: 2)
            case fourthAnswerButton: isAnswerCorrect = gameEngine.answerQuestion(with: 3)
            default: isAnswerCorrect = false
        }
        
        handleQuestionAnswered(isAnswerCorrect: isAnswerCorrect)
    }
    
    /*
     * Start a normal game
     */
    @IBAction func startNormalGame() {
        isLightningMode = false
        startGame()
    }
    
    /*
     * Start a lightning game
     */
    @IBAction func startLightningGame() {
        isLightningMode = true
        startGame()
    }

    // MARK: Helper Methods

    /*
     * Update the progress bar to reflect the time's up countdown
     */
    func updateProgressBar() {
        if lightningTimesupProgressBar.progress <= 0.0 {
            timesUp()
        }
        
        // Reduce a small amount of the progress each time
        lightningTimesupProgressBar.progress -= lightningProgressCountdownSlice
        
        if lightningTimesupProgressBar.progress < 1.0 / 3.0 {
            lightningTimesupProgressBar.tintColor = redProgressColor
        } else if lightningTimesupProgressBar.progress < 2.0 / 3.0 {
            lightningTimesupProgressBar.tintColor = orangeProgressColor
        }
    }
    
    /*
     * Update the question text and color
     */
    func updateQuestionText(text: String, color: UIColor = UIColor.white) {
        questionField.text = text
        questionField.textColor = color
    }
    
    /*
     * Convert the delay in secs to dispatch time used by asyncAfter
     */
    func calculateDispatchTime(seconds: Int) -> DispatchTime {
        // Converts a delay in seconds to nanoseconds as signed 64 bit integer
        let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
        
        // Calculates a time value to execute the method given current time and delay
        return DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
    }
    
    /*
     * Delay the next round to make it possible to read on screen texts
     */
    func loadNextRoundWithDelay(seconds: Int) {
        // Executes the nextRound method at the dispatch time on the main queue
        DispatchQueue.main.asyncAfter(deadline: calculateDispatchTime(seconds: seconds)) {
            self.nextRound()
        }
    }
}

