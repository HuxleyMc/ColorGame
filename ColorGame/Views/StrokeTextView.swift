//
//  StrokeTextView.swift
//  ColorGame
//
//  Created by Huxley McGuffin on 17/7/21.
//

import SwiftUI

struct StrokeTextView: View {
    let text: String
    let width: CGFloat
    let color: Color

    var body: some View {
        ZStack{
            ZStack{
                Text(text).offset(x:  width, y:  width)
                Text(text).offset(x: -width, y: -width)
                Text(text).offset(x: -width, y:  width)
                Text(text).offset(x:  width, y: -width)
            }
            .foregroundColor(color)
            Text(text)
        }
    }
}


struct StrokeTextView_Previews: PreviewProvider {
    static var previews: some View {
        StrokeTextView(text: "10", width: 0.9, color: Color.black)
            .foregroundColor(.green)
    }
}
