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
    func ScheduleNotification () {
        let content = UNMutableNotificationContent()
        content.title = "This is my first notification!"
        content.subtitle = "This was so easy."
        content.sound = .default
        content.badge = 1
        
        // time trigger
        let trigger = UNTimeIntervalNotificationTrigger(
            timeInterval: 5.0,
            repeats: false
        )
        
        let request = UNNotificationRequest(
            identifier: UUID().uuidString,
            content: content,
            trigger: trigger)
        UNUserNotificationCenter.current().add(request)
    }
}

struct LocalNotificationsBootcamp: View {
    var body: some View {
        VStack (spacing: 40) {
            Button("Request Permission") {
                NotificationManager.instance.requestAuthorization()
            }
            Button("Schedule Notification") {
                NotificationManager.instance.ScheduleNotification()
            }
        }
    }
}

#Preview {
    LocalNotificationsBootcamp()
}
