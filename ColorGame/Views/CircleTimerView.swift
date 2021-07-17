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
        
    var animation: Animation {
        Animation.linear(duration: 10)
            .repeatForever(autoreverses: false)
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(currentColor)
                .frame(width: size, height: size)
                .foregroundColor(.white)
            VStack {
                Text("\(timeRemaining)")
                Image(systemName: "hourglass")
                StrokeTextView(text: "\(score)", width: 0.5, color: Color.black)
                    .foregroundColor(scoreColor)
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
