//
//  ContentView.swift
//  Shared
//
//  Created by Fathoni on 20/07/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    var body: some View {
        NavigationView {
        #if os(iOS)
            TabBarView()
        #endif
        #if os(macOS)
            SideBarView()
        #endif
        #if os(watchOS)
            Text("Watch")
        #endif
        }
            .navigationTitle("Focused Apps")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
