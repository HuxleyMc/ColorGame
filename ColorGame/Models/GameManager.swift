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
    @Published var currentStreak: Int = 0
    @Published var isPaused: Bool = true
    @Published var gameStarted: Bool = false
    @Published var tilesClicked: Int = 0
    
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
        if gameStarted { return }
        print("Creating new timer")
        self.pickRandomColor()
        self.startTimer()
        self.gameStarted = true
    }
    
    func pause() {
        if (isPaused) {
            self.resume()
            self.isPaused = false
        } else {
            self.isPaused = true
            self.stopTimer()
        }
        
    }
    
    func resume() {
        if (isPaused) {
            self.pickRandomColor()
            self.startTimer()
            self.isPaused = false
        }
    }
    
    func startTimer() {
        if self.timer != nil { return }
        self.isPaused = false
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
        print("Reset game")
        self.gameStarted = false
        self.stopTimer()
        self.timeRemaining = 0
        self.currentTime = 0
        self.currentColor = nil
        self.currentStreak = 0
        self.isPaused = true
        self.scoreColor = .black
        self.score = 0
        self.tilesClicked = 0
    }
    
    func pickRandomColor() {
        var colors: [Color] = self.possibleColors
        colors.removeAll(where: {$0 == self.currentColor})
        self.currentColor = colors.randomElement()
    }
    
    
    func pickedColor(color: Color) {
        if !self.isRunning { return }
        self.tilesClicked += 1
        if color == currentColor {
            self.scoreColor = Color.green
            self.pickRandomColor()
            self.score += 1
            self.currentStreak += 1
        } else {
            self.scoreColor = Color.red
            self.pickRandomColor()
            self.score -= 1
            self.currentStreak = 0
        }
    }
}
