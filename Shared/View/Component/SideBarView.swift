//
//  SideBarView.swift
//  focused (iOS)
//
//  Created by Fathoni on 27/07/22.
//

import SwiftUI

struct SideBarView: View {
    var body: some View {
        NavigationView {
            List{
                Text("Tasks")
                    .fontWeight(.light)
                    .foregroundColor(.primary.opacity(0.7))
                NavigationLink{
                    TodayScreenView()
                    
                        .navigationTitle("Today")
                } label: {
                    Label("Today", systemImage: "tray.2")
                }

                NavigationLink {
                    HistoryScreenView()
                    
                        .navigationTitle("Histories")
                } label: {
                    Label("Histories", systemImage: "archivebox")
                }
            }
            WelcomeScreen()

            .navigationTitle("Focused Apps")
        }
        .environmentObject(TaskViewModel())
    }
}

struct SideBarView_Previews: PreviewProvider {
    static var previews: some View {
        SideBarView()
    }
}
