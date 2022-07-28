//
//  focusedApp.swift
//  Focused WatchKit Extension
//
//  Created by Fathoni on 28/07/22.
//

import SwiftUI

@main
struct focusedApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
