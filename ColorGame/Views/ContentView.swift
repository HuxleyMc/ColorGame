//
//  ContentView.swift
//  ColorGame
//
//  Created by Huxley McGuffin on 16/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var gameState = GameManager()
    
    var body: some View {
        ZStack {
            ColoredPanelView(pickedColor: gameState.pickedColor)
                // Avoid line below if possible
                .ignoresSafeArea()
            CircleTimerView(currentTime: gameState.currentTime, maxTime: gameState.maxTime,
                            score: gameState.score, scoreColor: gameState.scoreColor, currentColor: gameState.currentColor ?? Color.white
            )
            .onTapGesture {
                gameState.startGame()
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
