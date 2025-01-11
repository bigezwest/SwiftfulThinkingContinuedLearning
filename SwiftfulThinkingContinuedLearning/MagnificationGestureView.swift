//
//  MagnificationGestureView.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/11/25.
//

import SwiftUI

struct MagnificationGestureView: View {
    
    @State var currentAmount: CGFloat = 0
    
    var body: some View {
        Text("Example: Magnification Gesture")
            .font(.headline)
            .padding(.bottom, 10)
        Text("This uses MagnificationGesture to pinch and perform a zoom effect. Try pinching and dragging the text. This should be run in the simulator, not on the canvas.  Update main to run MagnificationGestureView().")
            .padding(.horizontal, 20)
            .padding(.bottom, 10)
        Text("Hello, World!")
            .font(.title)
            .padding(40)
            .background(Color.red)
            .cornerRadius(10)
            .scaleEffect(1 + currentAmount)
            .gesture(MagnificationGesture()
                .onChanged { value in
                    currentAmount = value - 1
                }
            )
    }
}

#Preview {
    MagnificationGestureView()
}
