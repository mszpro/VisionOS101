//
//  RobotSpeaking.swift
//  VisionOSDemo
//
//  Created by Msz on 8/21/24.
//

import SwiftUI
import AVFoundation

func speak(text: String) {
    let utterance = AVSpeechUtterance(string: text)
    utterance.voice = AVSpeechSynthesisVoice(language: "ja-JP")
    utterance.rate = 0.5
    utterance.pitchMultiplier = 1.5
    
    let synthesizer = AVSpeechSynthesizer()
    synthesizer.speak(utterance)
}
