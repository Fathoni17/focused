//
//  TabBar.swift
//  focused (iOS)
//
//  Created by Fathoni on 27/07/22.
//

import SwiftUI

struct TabBarView: View {
    @ObservedObject var taskVM: TaskViewModel
    var body: some View {
        TabView{
            NavigationView {
                TodayScreenView(taskVM: taskVM)
            }
                .tabItem {
                    VStack{
                        Image(systemName: "tray.2.fill")
                        Text("Today")
                    }
                }
            NavigationView {
                HistoryScreenView(taskVM: taskVM)
            }
                .tabItem {
                    VStack{
                        Image(systemName: "archivebox.fill")
                        Text("Histories")
                    }
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView(taskVM: TaskViewModel())
    }
}
