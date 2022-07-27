//
//  TodayScreenView.swift
//  focused (iOS)
//
//  Created by Fathoni on 28/07/22.
//

import SwiftUI

struct TodayScreenView: View {
    @ObservedObject var taskVM = TaskViewModel()
    
    var body: some View {
        VStack {
            // TODO: Create Greeting component
            
            List {
                Section {
                    ForEach(taskVM.tasks) {
                        // TODO: Create list item for TaskModel
                        Text($0.title)
                        #if os(macOS)
                            .padding(.vertical, 5)
                        #endif
                    }
                } header: {
                    Text("Today's Tasks")
                }
            }
                .listStyle(.inset)
        }
        #if os(iOS)
        .navigationBarHidden(true)
        #endif
    }
}

struct TodayScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TodayScreenView()
    }
}
