//
//  HapticsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/14/25.
//

import SwiftUI

class HapticManager {
    static let instance = HapticManager() // Singleton
    
    func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(type)
    }
    
    func impact(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }
}

struct HapticsBootcamp: View {
    var body: some View {
        VStack (spacing: 20) {
            Button("success") { HapticManager.instance.notification(type: .success) }
        }
    }
}

#Preview {
    HapticsBootcamp()
}
