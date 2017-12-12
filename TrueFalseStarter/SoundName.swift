//
//  SoundName.swift
//  TrueFalseStarter
//
//  Created by PrevoleTraining on 12.12.17.
//  Copyright © 2017 PrevoleTraining. All rights reserved.
//

///
/// Enum is great for refactorings
///
enum SoundName: String {
    // When the applicaiton starts
    case startGame
    
    // When a new game is started
    case startPlay
    
    // When the question is correctly answered
    case correct
    
    // When the question is wrongly answered
    case wrong
    
    // When the game is won by the user
    case winPlay
    
    // When the game is lost by the user
    case losePlay
}
