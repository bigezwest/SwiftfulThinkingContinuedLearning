//
//  GeometryReaderBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/13/25.
//

import SwiftUI

struct GeometryReaderBootcamp: View {
    var body: some View {
        HStack (spacing: 0) {
            Rectangle().fill(Color.red)
            Rectangle().fill(Color.blue)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    GeometryReaderBootcamp()
}
