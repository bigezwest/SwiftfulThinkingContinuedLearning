//
//  MultipleSheetsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/13/25.
//

import SwiftUI

struct RandomModel: Identifiable {
    let id = UUID().uuidString
    let title: String
}

// 1 - Use a binding
// 2 - Use multiple .shieets
// 3 - Use $item


struct MultipleSheetsBootcamp: View {
    
    @State var selectedModel: RandomModel = RandomModel(title: "Starting Title")
    @State var showSheet: Bool = false
    
    var body: some View {
        VStack (spacing: 20) {
            Button("Button 1") {
                selectedModel = RandomModel(title: "One")
                showSheet.toggle()
            }
            Button("Button 2") {
                selectedModel = RandomModel(title: "Two")
                showSheet.toggle()
            }
        }
        .sheet(isPresented: $showSheet, content: {
            NextScreen(selectedModel: $selectedModel)
        })
    }
}

struct NextScreen: View {
    @Binding var selectedModel: RandomModel
    var body: some View {
        Text(selectedModel.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsBootcamp()
}
