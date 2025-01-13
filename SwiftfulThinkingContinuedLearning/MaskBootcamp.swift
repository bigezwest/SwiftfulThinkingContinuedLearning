//
//  MaskBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/13/25.
//

import SwiftUI

struct MaskBootcamp: View {
    var body: some View {
        ZStack {
            HStack {
                ForEach(1..<6) { index in
                    Image(systemName: "star.fill")
                        .font(.largeTitle)
                        .foregroundColor(.gray)
                }
            }
        }
    }
}

#Preview {
    MaskBootcamp()
}
