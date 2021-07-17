//
//  GameManager.swift
//  ColorGame
//
//  Created by Huxley McGuffin on 16/7/21.
//

import Foundation
import SwiftUI

class GameManager: ObservableObject {
    
    @Published var maxTime: Int = 60
    @Published var currentTime: Int = 0
    @Published var timeRemaining: Int = 0
    @Published var score: Int = 0
    @Published var scoreColor: Color = Color.black
    
    @Published var isPaused: Bool = false
    
    var possibleColors: [Color] = [
        Color.red,
        Color.blue,
        Color.yellow,
        Color.green
    ]
    
    var currentColor: Color?
    
    
    var timer: Timer?
    
    init(maxTime: Int = 60) {
        self.maxTime = maxTime
    }
    
    var isRunning: Bool {
        self.timer != nil
    }
    
    func startGame() {
        if self.timer != nil { return }
        print("Creating new timer")
        self.pickRandomColor()
        self.startTimer()
    }
    
    func pause() {
        if (isPaused) {
            self.startGame()
            self.isPaused = false
        } else {
            self.isPaused = true
            self.stopTimer()
        }
        
    }
    
    func startTimer() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
            self.currentTime += 1
            self.timeRemaining = self.maxTime - self.currentTime
        }
    }
    
    func stopTimer() {
        self.timer?.invalidate()
        self.timer = nil
    }
    
    func resetGame() {
        self.stopTimer()
        self.timeRemaining = 0
        self.currentTime = 0
    }
    
    func pickRandomColor() {
        var colors: [Color] = self.possibleColors
        colors.removeAll(where: {$0 == self.currentColor})
        self.currentColor = colors.randomElement()
    }
    
    
    func pickedColor(color: Color) {
        if !self.isRunning { return }
        if color == currentColor {
            print("Correct color")
            self.scoreColor = Color.green
            self.pickRandomColor()
            self.score += 1
        } else {
            print("Wrong color")
            self.scoreColor = Color.red
            self.pickRandomColor()
            self.score -= 1
        }
    }
}
