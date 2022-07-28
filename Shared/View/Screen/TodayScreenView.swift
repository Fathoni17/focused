//
//  TodayScreenView.swift
//  focused (iOS)
//
//  Created by Fathoni on 28/07/22.
//

import SwiftUI

struct TodayScreenView: View {
    @ObservedObject var taskVM: TaskViewModel
    
    var body: some View {
        VStack {
            GreetingsView()
                .padding(.top, 20)
            
            List {
                Section {
                    ForEach(taskVM.tasks) {
                        TaskListItems(title: $0.title, count: $0.pomodoroCount)
                    }
                } header: {
                    Text("Today's Tasks")
                }
            }
                .listStyle(.inset)
                #if os(iOS)
                .navigationBarHidden(true)
                #endif
        }
    }
}

struct TodayScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TodayScreenView(taskVM: TaskViewModel())
    }
}
