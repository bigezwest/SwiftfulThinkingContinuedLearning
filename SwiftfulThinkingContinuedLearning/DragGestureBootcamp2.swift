//
//  DragGestureBootcamp2.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/13/25.
//

import SwiftUI

struct DragGestureBootcamp2: View {
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            
            VStack (spacing: 20) {
                Image(systemName: "chevron.up")
                    .padding(.top)
                Text("Sign up")
                    .font(.headline)
                    .fontWeight(.semibold)
                
                Image(systemName: "flame.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
                
                Text("This is the description of our app.  This is my favorite SwiftUI course and I recommend to all of my friends to subscribe to Swiftul Thinking. ")
                    .multilineTextAlignment(.center)
                
                 Text("Create an Account")
                    .foregroundColor(.white)
                    .font(.headline)
                    .padding()
                    .padding(.horizontal)
                    .background(Color.black.cornerRadius(10))
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .cornerRadius(30)
        }
        .ignoresSafeArea(edges: .bottom)
    }
}

#Preview {
    DragGestureBootcamp2()
}
