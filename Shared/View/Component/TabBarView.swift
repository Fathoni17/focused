//
//  TabBar.swift
//  focused (iOS)
//
//  Created by Fathoni on 27/07/22.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            NavigationView {
                TodayScreenView()
            }
                .tabItem {
                    VStack{
                        Image(systemName: "tray.2.fill")
                        Text("Today")
                    }
                }
            NavigationView {
                HistoryScreenView()
            }
                .tabItem {
                    VStack{
                        Image(systemName: "archivebox.fill")
                        Text("Histories")
                    }
                }
        }
        .accentColor(Color("primary"))
        .environmentObject(TaskViewModel())
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
