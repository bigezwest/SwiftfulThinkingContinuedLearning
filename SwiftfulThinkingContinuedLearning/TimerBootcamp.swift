//
//  TimerBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/17/25.
//

import SwiftUI

struct TimerBootcamp: View {
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1))]),
                center: .center,
                startRadius: 5,
                endRadius: 500)
            Text("Hi")
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
        }
    }
}

#Preview {
    TimerBootcamp()
}
