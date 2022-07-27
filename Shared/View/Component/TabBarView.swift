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
            TodayScreenView()
                .tabItem {
                    VStack{
                        Image(systemName: "tray.2.fill")
                        Text("Today")
                    }
                }
            Text("History Screen")
                .tabItem {
                    VStack{
                        Image(systemName: "archivebox.fill")
                        Text("History")
                    }
                }
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
