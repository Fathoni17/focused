//
//  TaskListItems.swift
//  focused
//
//  Created by Fathoni on 28/07/22.
//

import SwiftUI

struct TaskListItems: View {
    @EnvironmentObject var taskVM: TaskViewModel
    var task: TaskModel
    
    var body: some View {
        HStack {
            Text(task.title)
            Spacer()
            if task.pomodoroCount > 0 {
                Text("\(task.pomodoroCount)x  🍅")
            }
        }
        #if os(macOS)
        .padding(.vertical, 3)
        #endif
        .background()
        .onTapGesture {
            if !task.isDone {
                if task.pomodoroCount < 4 {
                    taskVM.startPomodoro(task: task)
                } else {
                    taskVM.markAsDone(task: task)
                }
            }
        }
    }
}

struct TaskListItems_Previews: PreviewProvider {
    static var previews: some View {
        TaskListItems(task: TaskModel(title: "Testing"))
    }
}
