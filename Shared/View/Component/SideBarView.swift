//
//  SideBarView.swift
//  focused (iOS)
//
//  Created by Fathoni on 27/07/22.
//

import SwiftUI

struct SideBarView: View {
    @ObservedObject var taskVM: TaskViewModel
    var body: some View {
        NavigationView {
            List{
                Text("Tasks")
                    .fontWeight(.light)
                    .foregroundColor(.primary.opacity(0.7))
                NavigationLink{
                    TodayScreenView(taskVM: taskVM)
                    
                        .navigationTitle("Today")
                } label: {
                    Label("Today", systemImage: "tray.2")
                }

                NavigationLink {
                    HistoryScreenView(taskVM: taskVM)
                    
                        .navigationTitle("History")
                } label: {
                    Label("History", systemImage: "archivebox")
                }
            }
            WelcomeScreen()

            .navigationTitle("Focused Apps")
        }
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView(taskVM: TaskViewModel())
    }
}
