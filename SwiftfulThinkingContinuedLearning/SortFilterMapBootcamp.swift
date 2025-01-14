//
//  SortFilterMapBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/14/25.
//

import SwiftUI

struct UserModel: Identifiable {
    let id = UUID().uuidString
    let name: String
    let points: Int
    let isVerified: Bool
}

class ArrayModificationVewModel: ObservableObject {
    
}

struct SortFilterMapBootcamp: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SortFilterMapBootcamp()
}
