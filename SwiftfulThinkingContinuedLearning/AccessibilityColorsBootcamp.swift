//
//  AccessibilityColorsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/20/25.
//

import SwiftUI

struct AccessibilityColorsBootcamp: View {
    
    @Environment(\.accessibilityReduceTransparency) var reduceTransparency
    @Environment(\.colorSchemeContrast) var colorSchemeContrast
    @Environment(\.accessibilityDifferentiateWithoutColor) var differentiateWIthoutColor
    @Environment(\.accessibilityInvertColors) var invertColors

    var body: some View {
        NavigationStack {
            VStack {
                Button("Button 1") {
                    
                }
                .foregroundColor(colorSchemeContrast == .increased ? .white : .primary)
                .buttonStyle(.borderedProminent)
                
                Button("Button 2") {
                    
                }
                .foregroundColor(.primary)
                .buttonStyle(.borderedProminent)
                .tint(.orange)
                
                Button("Button 3") {
                    
                }
                .foregroundColor(.white)
                .foregroundColor(.primary)
                .buttonStyle(.borderedProminent)
                .tint(.green)
                
                Button("Button 4") {
                    
                }
                .foregroundColor(.green)
                .foregroundColor(.primary)
                .buttonStyle(.borderedProminent)
                .tint(differentiateWIthoutColor ? .black : .purple)
                
            }
            .font(.largeTitle)
//            .navigationTitle("Title")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .ignoresSafeArea(.all)
//            .background(reduceTransparency ? Color.black : Color.black.opacity(0.5))
        }
    }
}

#Preview {
    AccessibilityColorsBootcamp()
}
