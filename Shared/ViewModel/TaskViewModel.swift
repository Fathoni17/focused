//
//  TaskViewModel.swift
//  focused (iOS)
//
//  Created by Fathoni on 28/07/22.
//

import Foundation

class TaskViewModel: ObservableObject {
    @Published var tasks: [TaskModel] = []
    @Published var histories: [TaskModel] = []
    
    init() {
        self.tasks.append(TaskModel(title: "Testing"))
    }
    
    func addNewTask(title: String) {
        self.tasks.append(TaskModel(title: title))
    }
    
    func startPomodoro(task: TaskModel) {
        if let i = tasks.firstIndex(of: task) {
            tasks[i].pomodoroCount = tasks[i].pomodoroCount + 1
        }
    }
    
    func markAsDone(task: TaskModel) {
        if var taskSelected = tasks.first(where: { $0.id == task.id }) {
            taskSelected.isDone = true;
            self.histories.append(taskSelected)
            self.tasks.removeAll(where: { $0.id == task.id })
        }
    }
}
