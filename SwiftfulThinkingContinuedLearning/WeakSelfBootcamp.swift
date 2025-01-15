//
//  WeakSelfBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/15/25.
//

import SwiftUI

struct WeakSelfBootcamp: View {
    var body: some View {
        NavigationView {
            NavigationLink("Navigate", destination:
                WeakSelfSecondScreen())
                .navigationTitle("Screen 1")
        }
    }
}
struct WeakSelfSecondScreen: View {
    var body: some View {
        Text("Second View")
            .font(.largeTitle)
            .foregroundColor(.red)
    }
}

#Preview {
    WeakSelfBootcamp()
}
