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
//        GeometryReader { geometry in
//            HStack (spacing: 0) {
//                Rectangle()
//                    .fill(Color.red)
//                    .frame(width: geometry.size.width * 0.6666)
//                Rectangle().fill(Color.blue)
//            }
//            .ignoresSafeArea()
//        }
        
        // Ex: 2 - Horizontal Scroll -------------------------------------------
        ScrollView(.horizontal, showsIndicators: false, content: {
            HStack {
                ForEach(0..<20) { index in
                    GeometryReader { geometry in
                        RoundedRectangle(cornerRadius: 20)
                            .rotation3DEffect(
                                Angle(degrees: getPercentage(geo: geometry) * 40),
                                axis: (x: 0.0, y: 1.0, z: 0.0))
                    }
                    .frame(width: 300, height: 250)
                    .padding()
                }
            }
        })
    }
}

func getPercentage(geo: GeometryProxy) -> Double {
    let maxDistance = UIScreen.main.bounds.width / 2
    let currentX = geo.frame(in: .global).midX
    return Double(1 - (currentX / maxDistance))
}
#Preview {
    GeometryReaderBootcamp()
}
