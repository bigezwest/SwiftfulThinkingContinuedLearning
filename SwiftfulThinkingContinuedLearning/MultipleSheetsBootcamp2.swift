//
//  MultipleSheetsBootcamp2.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/13/25.
//

import SwiftUI

struct RandomModel2: Identifiable {
    let id = UUID().uuidString
    let title: String
}
// There are 3 methods.  Each will be in its own MultipleSheetsBootcamp View.

// 1 - Use a binding
// 2 - Use multiple .sheets - Shown here ---------------------------------------
// 3 - Use $item


struct MultipleSheetsBootcamp2: View {
   
    @State var selectedModel2: RandomModel2 = RandomModel2(title: "Starting Title")
    @State var showSheet: Bool = false
    @State var showSheet2: Bool = false
   
    var body: some View {
        VStack (spacing: 20) {
            Button("Button 1") {
                showSheet.toggle()
            }
            .sheet(isPresented: $showSheet, content: {
                NextScreen2(selectedModel2: RandomModel2(title: "One"))
            })
            Button("Button 2") {
                showSheet2.toggle()
            }
            .sheet(isPresented: $showSheet2, content: {
                NextScreen2(selectedModel2: RandomModel2(title: "Two"))
            })
        }
    }
}

struct NextScreen2: View {
    let selectedModel2: RandomModel2
    var body: some View {
        Text(selectedModel2.title)
            .font(.largeTitle)
    }
}

#Preview {
    MultipleSheetsBootcamp2()
}
