//
//  TimerBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/17/25.
//

import SwiftUI

struct TimerBootcamp: View {
    
    let timer = Timer.publish(every: 0.5, on: .main, in: .common).autoconnect()
    
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
    
    // Countdown to Date -------------------------------------------------------
    /*
    @State var timeRemaining: String = ""
    let futureDate: Date = Calendar.current.date(byAdding: .day, value: 1, to: Date()) ?? Date()
    */
    
    // Animation Counter -------------------------------------------------------
    /*
    @State var count: Int = 0
    */
    var body: some View {
        ZStack {
            RadialGradient(
                gradient: Gradient(colors: [Color(#colorLiteral(red: 0.01680417731, green: 0.1983509958, blue: 1, alpha: 1)), Color(#colorLiteral(red: 0.004859850742, green: 0.09608627111, blue: 0.5749928951, alpha: 1))]),
                center: .center,
                startRadius: 5,
                endRadius: 500)
//            Text(dateFormatter.string(from: currentDate))     // CurrentDate
//            Text(finishedText ?? "\(count)")                  // Count
                                                                // Time Remaining
            /*
            Text(timeRemaining)                               // Time Remaining
                .font(.system(size: 100, weight: .semibold, design: .rounded))
                .foregroundColor(.white)
                .lineLimit(1)
                .minimumScaleFactor(0.1)
             */
            // Animation Counter - HStack --------------------------------------
            /*
            HStack (spacing: 15) {
                Circle()
                    .offset(y: count == 1 ? -20 : 0)
                Circle()
                    .offset(y: count == 2 ? -20 : 0)
                Circle()
                    .offset(y: count == 3 ? -20 : 0)
            }
            .frame(width: 150)
            .foregroundColor(.white)
             */
            
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
        
        // - .onReceive - timeRemaining ----------------------------------------
        /*
        .onReceive(timer, perform: { _ in
            updateTimeRemaining()
        })
         */
        
        // - .onReceive - Animation COunter ------------------------------------
        /*
            .onReceive(timer, perform: { _ in
                withAnimation(.easeIn(duration: 0.5) ) {
                    count = count == 3 ? 0 : count + 1
                }
            })
         */
    }
    // - Countdown to Date function --------------------------------------------
    /*
    func updateTimeRemaining() {
        let remaining = Calendar.current.dateComponents(
            [.hour, .minute, .second], from: Date(), to: futureDate)
        let hour = remaining.hour ?? 0
        let minute = remaining.minute ?? 0
        let second = remaining.second ?? 0
        timeRemaining = "\(hour):\(minute):\(second)"
    }
     */
}

#Preview {
    TimerBootcamp()
}
