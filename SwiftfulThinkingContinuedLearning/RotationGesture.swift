//
//  RotationGesture.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/12/25.
//

import SwiftUI

struct RotationGesture: View {
    
    @State var angle: Angle = Angle(degrees: 0)
    
    var body: some View {
        Text("Rotation Gesture")
            .font(.largeTitle)
            .fontWeight(.semibold)
            .foregroundColor(.white)
            .padding(50)
            .background(Color.blue).cornerRadius(10)
            .rotationEffect(angle)
            .gesture(RotateGesture()
                .onChanged { value in
                    angle = value.rotation
                }
                .onEnded { value in
                    withAnimation(.spring()) {
                        angle = Angle(degrees: 0)
                    }
                }
            )
    }
}

#Preview {
    RotationGesture()
}
