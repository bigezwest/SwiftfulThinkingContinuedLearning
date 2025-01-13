//
//  MaskBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/13/25.
//

import SwiftUI

struct MaskBootcamp: View {
    
    @State var rating: Int = 4
    
    var body: some View {
        ZStack {
            HStack {
                ForEach(1..<6) { index in
                    Image(systemName: "star.fill")
                        .font(.largeTitle)
                        .foregroundColor(rating >= index ? Color.yellow : Color.gray)
                        .onTapGesture { rating = index }
                }
            }
        }
    }
}

#Preview {
    MaskBootcamp()
}
