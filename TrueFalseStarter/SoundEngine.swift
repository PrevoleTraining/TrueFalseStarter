//
//  SoundEngine.swift
//  TrueFalseStarter
//
//  Created by PrevoleTraining on 12.12.17.
//  Copyright © 2017 PrevoleTraining. All rights reserved.
//

import AudioToolbox

class SoundEngine {
    // The collection of sounds
    var sounds: [SoundName: (path: String, sound: SystemSoundID)] = [
        SoundName.correct: (path: "r2d2-yeah", sound: 0),
        SoundName.wrong: (path: "chewy-roar", sound: 0),
        SoundName.startPlay: (path: "light-saber-on", sound: 0),
        SoundName.startGame: (path: "red-alert", sound: 0),
        SoundName.losePlay: (path: "jabba", sound: 0),
        SoundName.winPlay: (path: "throne-room-really-short", sound: 0)
    ]
    
    init() {
        // Load all the game sounds
        for (name, soundDef) in sounds {
            let pathToSoundFile = Bundle.main.path(forResource: soundDef.path, ofType: "wav", inDirectory: "sounds")
            let soundURL = URL(fileURLWithPath: pathToSoundFile!)
            AudioServicesCreateSystemSoundID(soundURL as CFURL, &(sounds[name]!.sound))
        }
    }
    
    ///
    /// Play the specified sound.
    ///
    /// @param soundName The sound to play
    ///
    func playSound(with soundName: SoundName) {
        AudioServicesPlaySystemSound(sounds[soundName]!.sound)
    }
}
