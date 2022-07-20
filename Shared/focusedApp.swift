//
//  focusedApp.swift
//  Shared
//
//  Created by Fathoni on 20/07/22.
//

import SwiftUI

@main
struct focusedApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
