//
//  LocalNotifications.swift
//  CyberDo
//
//  Created by Jonas Fernando Nascimento Melo on 29/07/25.
//
import UserNotifications
import Foundation
import CoreData
import SwiftUI

struct LocalNotifications {
    
    public static func AddNotification(title: String, subtitle: String, body: String, hour: Int, minute: Int, interval: Double) {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
                if requests.isEmpty {
                    let content = UNMutableNotificationContent()
                    content.title = title
                    content.subtitle = subtitle
                    content.body = body
                    content.sound = UNNotificationSound.default
                    
                    var dateNow: Date = Date.now
                    var dateComponents: DateComponents = Calendar.current.dateComponents([.day, .month, .year], from: dateNow)
                    
                    dateComponents.hour = hour
                    dateComponents.minute = minute
                    
                    let timesInMouth: Int = Int(2592000.00 / interval)
                    
                    
                    for _ in 0 ..< timesInMouth{
                        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: false)
                        
                        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                        
                        UNUserNotificationCenter.current().add(request) { error in
                            if let error = error {
                                print(error.localizedDescription)
                            } else {
                                print("Notification scheduled")
                            }
                        }
                        
                        dateNow = dateNow.addingTimeInterval(interval)
                        
                        dateComponents = Calendar.current.dateComponents([.day, .month, .year], from: dateNow)
                        dateComponents.hour = hour
                        dateComponents.minute = minute
                    }
                }
        }
    }
    
    public static func removeNotification() {
        UNUserNotificationCenter.current().removeAllDeliveredNotifications()
        UNUserNotificationCenter.current().removeAllPendingNotificationRequests()
        
    }

    public static func permissaoNotification() {
        
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { status, error in
            if !status, let error = error {
                fatalError("[ERROR]: Unable to request permissions for notifications (\(error.localizedDescription))")
            }
            if status {
                AddNotification(title: "Suas Quests estão com sdds de vc", subtitle: "as metas nem tanto", body: "elas não vao ser feitas sozinhas 🤨", hour: 17, minute: 28, interval: 2000)
            }
        }
    }
    
    public static func getScheduledNotifications() {
        UNUserNotificationCenter.current().getPendingNotificationRequests { requests in
            if requests == []{
                print("No notification")
            }
            for request in requests {
                print("Scheduled Notification ID: \(request.identifier)")
                print("Title: \(request.content.title)")
                print("Subtitle: \(request.content.subtitle)")
                
                if let calendarTrigger = request.trigger as? UNCalendarNotificationTrigger {
                    print("Trigger Date Components: \(calendarTrigger)")
                } else if let timeIntervalTrigger = request.trigger as? UNTimeIntervalNotificationTrigger {
                    print("Trigger Time Interval: \(timeIntervalTrigger.timeInterval) seconds")
                }
                print("---")
            }
        }
    }
    
}





