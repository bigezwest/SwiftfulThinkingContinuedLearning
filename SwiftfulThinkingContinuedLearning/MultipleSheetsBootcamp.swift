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
    var body: some View {
        VStack (spacing: 20) {
            Button("Button 1") {
                
            }
            Button("Button 2") {
                
            }
        }
    }
}

#Preview {
    MultipleSheetsBootcamp()
}
