//
//  MenuView.swift
//  ColorGame
//
//  Created by Huxley McGuffin on 17/7/21.
//

import SwiftUI

struct MenuView: View {
    
    @State var gameState: GameManager
    @State var tapStart = false
    @State var tapRestart = false
    
    let startGame: () -> Void
    let resetGame: () -> Void
    
    
    var body: some View {
        List {
            Section(header: Text("Menu")) {
                HStack(alignment: .center) {
                    Button(action: {}, label: {
                        Text("Start")
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                            )
                    })
                    .disabled(gameState.gameStarted)
                    .scaleEffect(tapStart ? 0.6 : 1)
                    .rotation3DEffect(
                        .degrees(tapStart ? 20 : 0),
                        axis: (x: 2.0, y: -1.0, z: 1.0)
                    )
                    .rotationEffect(Angle(degrees: tapStart ? 30 : 0))
                    .animation(.spring(response: 0.4, dampingFraction: 0.6))
                    .onTapGesture {
                        self.startGame()
                        tapStart = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            tapStart = false
                        }
                    }
                    Spacer()
                    Button(action: {}, label: {
                        Text("Restart")
                            .padding()
                            .foregroundColor(.red)
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(lineWidth: 2)
                                    .fill(Color.red)
                            )
                    })
                    .scaleEffect(tapRestart ? 0.6 : 1)
                    .rotation3DEffect(
                        .degrees(tapRestart ? -20 : 0),
                        axis: (x: -2.0, y: 1.0, z: -1.0)
                    )
                    .rotationEffect(Angle(degrees: tapRestart ? -30 : 0))
                    .animation(.spring(response: 0.4, dampingFraction: 0.6))
                    .onTapGesture {
                        self.resetGame()
                        tapRestart = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            tapRestart = false
                        }
                    }
                    .padding()
                }
            }
            if gameState.gameStarted {
                Section(header: Text("Current Game")) {
                    Text("Streak \(gameState.currentStreak)")
                    Text("Score \(gameState.score)")
                    Text("Tiles Clicked \(gameState.tilesClicked)")
                }
                
            }
            
        }.listStyle(InsetGroupedListStyle())
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView(gameState: GameManager(), startGame: {}, resetGame: {})
        //            .previewLayout(.sizeThatFits)
    }
}
