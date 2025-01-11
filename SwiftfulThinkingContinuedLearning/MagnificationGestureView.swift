//
//  MagnificationGestureView.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/11/25.
//

import SwiftUI

struct MagnificationGestureView: View {
    
    @State var currentAmount: CGFloat = 0
    @State var lastAmount: CGFloat = 0
    
    var body: some View {
        // Ex: 2 ---------------------------------------------------------------
        Text("This would be an example of an instagram feed.  Pinch the black box to zoom in and out.  Run on the simulator, not on the canvas. ")
        VStack {
            HStack {
                Circle().frame(width: 35, height: 35)
                Text("Swiftul Thinking")
                Spacer()
                Image(systemName: "ellipsis")
                
            }
            .padding(.horizontal)
            Rectangle()
                .frame(height: 300)
                .scaleEffect(1 + currentAmount)
                .gesture(MagnificationGesture()
                    .onChanged {value in
                        currentAmount = value - 1
                    }
                    .onEnded {value in
                        withAnimation(.spring()) {
                            currentAmount = 0
                        }
                    }
                )
            
            HStack {
                Image(systemName: "heart.fill")
                Image(systemName: "text.bubble.fill")
                    Spacer()
            }
            .padding(.horizontal)
            .font(.headline)
            Text("This is the caption for my photo!")
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
        
        //        Text("Example: Magnification Gesture")
        //            .font(.headline)
        //            .padding(.bottom, 10)
        //        Text("This uses MagnificationGesture to pinch and perform a zoom effect. Try pinching and dragging the text. This should be run in the simulator, not on the canvas.  Update main to run MagnificationGestureView().")
        //            .padding(.horizontal, 20)
        //            .padding(.bottom, 10)
        //
        //        Text("Hello, World!")
        //            .font(.title)
        //            .padding(40)
        //            .background(Color.red)
        //            .cornerRadius(10)
        //            .scaleEffect(1 + currentAmount + lastAmount)
        //            .gesture(MagnificationGesture()
        //                 // Used for the current pinch  or zoom amount
        //                .onChanged { value in
        //                    currentAmount = value - 1
        //                }
        //                 // Use to keep track of the last pinch or zoom amount
        //                 // This is so that if a "repinch" occurs, the zoom will not reset before starting.
        //                .onEnded { value in
        //                    lastAmount += currentAmount
        //                    currentAmount = 0
        //                }
        //            )
    }
}
}

#Preview {
    MagnificationGestureView()
}
