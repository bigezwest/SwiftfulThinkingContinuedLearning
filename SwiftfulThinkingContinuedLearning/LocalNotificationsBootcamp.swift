//
//  LocalNotificationsBootcamp.swift
//  SwiftfulThinkingContinuedLearning
//
//  Created by Thomas on 1/14/25.
//

import SwiftUI
import UserNotifications
class NotificationManager {
    static let instance = NotificationManager() // Singleton
    
    func requestAuthorization () {
        let options: UNAuthorizationOptions = [.alert, .badge, .sound]
        UNUserNotificationCenter
            .current()
            .requestAuthorization(
                options: options) { (success, error) in
                    if let error = error {
                        print("ERROR: \(error)")
                    } else {
                        print("SUCCESS")
                    }
                }
    }
}

struct LocalNotificationsBootcamp: View {
    var body: some View {
        VStack (spacing: 40) {
            Button("Request Permission") {
                NotificationManager.instance.requestAuthorization()
            }
        }
    }
}

#Preview {
    LocalNotificationsBootcamp()
}
