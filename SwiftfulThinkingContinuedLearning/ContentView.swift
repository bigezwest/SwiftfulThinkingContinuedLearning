//
//  ContentView.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/11/25.
//

import SwiftUI

struct ContentView: View {
    
    @State var isComplete: Bool = false
    
    var body: some View {
        
        // Ex: 1 - Button - onLongPressGesture ---------------------------------
        Text(isComplete ? "Completed" : "Not Completed")
            .padding()
            .padding(.horizontal)
            .background(isComplete ? Color.green : Color.gray)
            .cornerRadius(10)
            .onLongPressGesture (
                minimumDuration: 1.0,
                maximumDistance: 50
            ) {
                isComplete.toggle()
            }
        
        // Ex: 2 - Retangle - 2 buttons - onLongPressGesture -------------------
        VStack {
            Rectangle()
                .fill(Color.blue)
                .frame(maxWidth: 10)
                .frame(height: 55)
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Color.gray)
            HStack {
                Text("Click Here")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
                Text("Reset")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(10)
            }
        }
    }
}

#Preview {
    ContentView()
}
