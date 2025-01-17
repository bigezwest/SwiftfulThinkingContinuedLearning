//
//  TimerBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/17/25.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    
    // Current Time ------------------------------------------------------------
/*
    @State var currentDate: Date = Date()
     var dateFormatter: DateFormatter{
         let formatter = DateFormatter()
         formatter.timeStyle = .medium
         return formatter
     }
 */
    
    // Countdown ---------------------------------------------------------------
/*
    @State var count: Int = 10
    @State var finishedText: String? = nil
  */
    
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1))]),
                center: .center,
                startRadius: 5,
                endRadius: 500)
//            Text(dateFormatter.string(from: currentDate))   // CurrentDate
//            Text(finishedText ?? "\(count)")              // Count
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
            
        }
        // - .onReceive - currentDate ------------------------------------------
        /*
        .onReceive(timer, perform: { value in
            currentDate = value
        })
         */
        
        // - .onReceive - Timer ------------------------------------------------
        /*
        .onReceive(timer, perform: { _ in
            if count <= 1 {
                finishedText = "Wow!"
            } else {
                count -= 1
            }
        })
         */
    }
}

#Preview {
    TimerBootcamp()
}
