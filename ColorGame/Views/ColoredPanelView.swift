//
//  ColoredPanelView.swift
//  ColorGame
//
//  Created by Huxley McGuffin on 16/7/21.
//

import SwiftUI

struct ColoredPanelView: View {
    var pickedColor: (Color) -> Void
    
    var body: some View {
        VStack(spacing: 0.0) {
            HStack(spacing: 0.0) {
                Rectangle()
                    .foregroundColor(.blue)
                    .onTapGesture {
                        pickedColor(.blue)
                    }
                Rectangle()
                    .foregroundColor(.red)
                    .onTapGesture {
                        pickedColor(.red)
                    }
            }
            HStack(spacing: 0.0) {
                Rectangle()
                    .foregroundColor(.yellow)
                    .onTapGesture {
                        pickedColor(.yellow)
                    }
                Rectangle()
                    .foregroundColor(.green)
                    .onTapGesture {
                        pickedColor(.green)
                    }
                    
            }
        }
    }
}

struct ColoredPanelView_Previews: PreviewProvider {
    static var previews: some View {
        ColoredPanelView(pickedColor: { _ in })
            .previewLayout(.sizeThatFits)
    }
}
