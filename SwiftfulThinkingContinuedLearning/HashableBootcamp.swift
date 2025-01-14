//
//  HashableBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/14/25.
//

import SwiftUI

struct MyCustomModel {
    let title: String
}

struct HashableBootcamp: View {
    
    let data: [MyCustomModel] = [
        MyCustomModel(title: "One"),
        MyCustomModel(title: "Two"),
        MyCustomModel(title: "Three"),
        MyCustomModel(title: "Four"),
        MyCustomModel(title: "Five")
    ]
    
    var body: some View {
        ScrollView {
            VStack (spacing: 40) {
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
