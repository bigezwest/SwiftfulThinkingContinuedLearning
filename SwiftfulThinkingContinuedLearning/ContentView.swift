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
        Text(isComplete ? "Completed" : "Not Completed")
            .padding()
            .padding(.horizontal)
            .background(isComplete ? Color.green : Color.gray)
            .cornerRadius(10)
            .onLongPressGesture (
                minimumDuration: 1.0
            ) {
                isComplete.toggle()
            }
    }
}

#Preview {
    ContentView()
}
