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

    @StateObject var taskVM = TaskViewModel()
    
    var body: some View {
    #if os(iOS)
        TabBarView(taskVM: taskVM)
    #endif
    #if os(macOS)
        SideBarView(taskVM: taskVM)
    #endif
    #if os(watchOS)
        Text("Watch")
    #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
