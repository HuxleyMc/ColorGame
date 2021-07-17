//
//  ContentView.swift
//  ColorGame
//
//  Created by Huxley McGuffin on 16/7/21.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var gameState = GameManager()
    
    @State var isPresented: Bool = false
    
    var body: some View {
        ZStack {
            ColoredPanelView(pickedColor: gameState.pickedColor)
                // Avoid line below if possible
                .ignoresSafeArea()
            CircleTimerView(currentTime: gameState.currentTime, maxTime: gameState.maxTime,
                            score: gameState.score, scoreColor: gameState.scoreColor, currentColor: gameState.currentColor ?? Color.white
            )
            VStack(alignment: .leading) {
                HStack {
                    Button(action: {
                        if !gameState.isPaused {
                            gameState.pause()
                        }
                        isPresented = true
                    }) {
                        Image(systemName: "house.fill")
                            .foregroundColor(.black)
                            .font(.title)
                            .frame(width: 60, height: 60, alignment: .center)
                    }
                    Spacer()
                    Button(action: {
                        gameState.pause()
                    }) {
                        Image(systemName: gameState.isPaused ? "play.fill" : "pause.fill")
                            .foregroundColor(.black)
                            .font(.title)
                            .frame(width: 60, height: 60, alignment: .center)
                    }
                    
                }
                Spacer()
            }
        }
        .sheet(isPresented: $isPresented, content: {
            MenuView(gameState: gameState, startGame: {
                isPresented = false
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    gameState.startGame()
                }
            }, resetGame: {
                print("reset menu")
                gameState.resetGame()
            })
        })
    }
    
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
