//
//  TaskListItems.swift
//  focused
//
//  Created by Fathoni on 28/07/22.
//

import SwiftUI

struct TaskListItems: View {
    var title: String
    var count: UInt?
    var isDone: Bool = false
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            if count != nil {
                Text("\(count!)x  🍅")
            }
        }
        #if os(macOS)
        .padding(.vertical, 3)
        #endif
        .onTapGesture {
            print("\(title) clicked")
            if !isDone {
                // TODO: implement start pomodoro
                print("Do you want to start this task?")
            }
        }
    }
}

struct TaskListItems_Previews: PreviewProvider {
    static var previews: some View {
        TaskListItems(title: "Task title for testing", count: 2)
    }
}
