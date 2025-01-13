//
//  MultipleSheetsBootcamp3.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/13/25.
//

import SwiftUI

struct RandomModel3: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// There are 3 methods.  Each will be in its own MultipleSheetsBootcamp View.

// 1 - Use a binding
// 2 - Use multiple .sheets
// 3 - Use $item - Shown here --------------------------------------------------

struct MultipleSheetsBootcamp3: View {
    
    
    @State var selectedModel3: RandomModel3? = nil

    var body: some View {
        
        ScrollView {
            VStack (spacing: 20) {
                
                ForEach(0..<50) { index in
                    Button("Button \(index)") {
                        selectedModel3 = RandomModel3(title: "\(index)")
                    }
                }
            }
            .sheet(item: $selectedModel3) { model in
                NextScreen3(selectedModel3: model)
            }
        }
    }
}

struct NextScreen3: View {
    let selectedModel3: RandomModel3
    var body: some View {
        Text(selectedModel3.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsBootcamp3()
}
