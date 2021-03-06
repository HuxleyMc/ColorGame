//
//  CircleTimerView.swift
//  ColorGame
//
//  Created by Huxley McGuffin on 16/7/21.
//

import SwiftUI

struct CircleTimerView: View {
    private let size: CGFloat = 100.0
    var currentTime: Int
    var maxTime: Int
    var score: Int
    var scoreColor: Color
    var currentColor: Color
    
    var timeRemaining: Int {
        maxTime - currentTime
    }

    
    var body: some View {
        ZStack {
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 2))
                .fill(Color.black)
                .background(
                    Circle()
                        .foregroundColor(currentColor)
                )
                .frame(width: size, height: size)
                .foregroundColor(.white)
            VStack {
                HStack(spacing: 0.1) {
                    Text("\(timeRemaining)")
                    Text("s")
                        .font(.caption)
                }
                HStack(spacing: 0.1) {
                    StrokeTextView(text: "\(score)", width: 0.5, color: Color.black)
                        .foregroundColor(scoreColor)
                    Image(systemName: scoreColor == Color.red ? "arrow.down" : "arrow.up")
                        .font(.caption)
                }
            }
            .font(.title)
            .foregroundColor(.black)
            
            
        }
    }
}

struct CircleTimerView_Previews: PreviewProvider {
    @State var gameState = GameManager()
    func picked(color: Color) -> Void {
        print(color.description)
    }
    static var previews: some View {
        CircleTimerView(currentTime: 10, maxTime: 10, score: 10, scoreColor: Color.green, currentColor: Color.green)
            .padding()
            .previewLayout(.sizeThatFits)
            .background(Color.black)
    }
}
