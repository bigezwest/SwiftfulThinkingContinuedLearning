//
//  GeometryReaderBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/13/25.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    var body: some View {
            
        // Ex: 1 - Use geometry reader to measure left rectangle ---------------
        GeometryReader { geometry in
            HStack (spacing: 0) {
                Rectangle()
                    .fill(Color.red)
                    .frame(width: geometry.size.width * 0.6666)
                Rectangle().fill(Color.blue)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    GeometryReaderBootcamp()
}
