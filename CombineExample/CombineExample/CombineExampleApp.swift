//
//  CombineExampleApp.swift
//  CombineExample
//
//  Created by Nitin Bhatt on 15/01/25.
//

import SwiftUI

@main
struct CombineExampleApp: App {
    var body: some Scene {
        WindowGroup {
            UserView().onAppear() {
                let center = UNUserNotificationCenter.current()
                
                center.requestAuthorization(options: [.alert, .sound]) { granted, error in
                    // If `granted` is `true`, you're good to go!
                    self.notificationCategory()
                }
            }
        }
    }
    
    func notificationCategory() {
        // Action
        let snoozeButton = UNNotificationAction(identifier: "snooze", title: "Snooze", options: .init(rawValue: 0))
        let snoozeCategory = UNNotificationCategory(identifier: "snooze_category", actions: [snoozeButton], intentIdentifiers: [], options: .customDismissAction)
        UNUserNotificationCenter.current().setNotificationCategories([snoozeCategory])
    }
}
