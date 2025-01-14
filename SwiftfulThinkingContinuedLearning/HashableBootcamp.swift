//
//  HashableBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/14/25.
//

import SwiftUI

struct HashableBootcamp: View {
    
    let data: [String] = [
        "One", "Two", "Three", "Four", "Five"
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(data, id: \.self) { item in
                    Text(item)
                        .font(.headline)
                }
            }
        }
    }
}

#Preview {
    HashableBootcamp()
}
