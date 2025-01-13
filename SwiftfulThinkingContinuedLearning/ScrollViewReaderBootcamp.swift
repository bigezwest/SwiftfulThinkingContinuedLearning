//
//  ScrollViewReaderBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/13/25.
//

import SwiftUI

struct ScrollViewReaderBootcamp: View {
    var body: some View {
        ScrollView {
            ForEach(0..<50) { index in
                Text("This is item #\(index)")
                    .font(.headline)
                    .frame(height: 200)
                    .frame(maxWidth: .infinity)
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 10)
                    .padding()
            }
        }
    }
}

#Preview {
    ScrollViewReaderBootcamp()
}