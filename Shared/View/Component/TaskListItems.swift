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
    
    @State var isStartConfirm = false
    @State var isDoneConfirm = false
    @State var goToPomodoro = false
    
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
                isStartConfirm = true
            }
        }
        .onLongPressGesture(perform: {
            if !task.isDone && task.pomodoroCount > 0 {
                isDoneConfirm = true
            }
        })
        
        // MARK: - Confirmation/ActionSheet
        .confirmationDialog("Has \(task.title) been completed?", isPresented: $isDoneConfirm, actions: {
            Button("Yes", role: .destructive) {
                taskVM.markAsDone(task: task)
            }
            Button("No yet", role: .cancel) {
                isDoneConfirm = false
            }
        }, message: {
            Text("The completed task will be moved to history. Have you finished it?")
        })
        .confirmationDialog("Start Pomodoro", isPresented: $isStartConfirm) {
            Button("Start") {
                taskVM.startPomodoro(task: task)
                goToPomodoro =  true
            }
            Button("Cancel", role: .cancel) {
                isStartConfirm = false
            }
        } message: {
            Text("Are you sure want to start focusing on \(task.title)?")
        }

        #if os(iOS)
        .fullScreenCover(isPresented: $goToPomodoro) {
            PomodoroTimer(task: task)
        }
        #endif
    }
}

struct TaskListItems_Previews: PreviewProvider {
    static var previews: some View {
        TaskListItems(task: TaskModel(title: "Testing"))
    }
}
