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
    @Published var focusLevel: Float = 0
    
    init() {
        // TODO: Load task
        
        // TODO: Load Histories
        
        // TODO: Calculation start here

        // MARK: - Mocking data for display
        self.tasks.append(TaskModel(title: "Testing"))
    }
    
    func addNewTask(title: String) {
        self.tasks.append(TaskModel(title: title))
    }
    
    func getFocusLevel() -> Float {
        // TODO: Calculate from histories
        
        return focusLevel
    }
    
    func recheckTask(task: TaskModel) {
        if var itask = tasks.first(where: { $0.id == task.id }) {
            // TODO: Need some calculation here
            
            itask.isStillEfective = true
        }
    }
    
    func startPomodoro(task: TaskModel) {
        if var taskSelected = tasks.first(where: { $0.id == task.id }) {            
            taskSelected.pomodoroCount = taskSelected.pomodoroCount + 1
            taskSelected.lastPomodoroStartedAt = Date()
            taskSelected.isResting = false
        }
    }
    
    func continueForResting(task: TaskModel) {
        if var taskSelected = tasks.first(where: { $0.id == task.id }) {
            taskSelected.elapsedTime = (taskSelected.elapsedTime ?? 0) + 25
            taskSelected.isResting = true
        }
    }
    
    func restartTask(task: TaskModel) {
        self.tasks.append(TaskModel(title: task.title))
        self.markAsDone(task: task)
    }
    
    func markAsDone(task: TaskModel) {
        if var taskSelected = tasks.first(where: { $0.id == task.id }) {
            taskSelected.isDone = true;
            self.histories.append(taskSelected)
            self.tasks.removeAll(where: { $0.id == task.id })
        }
    }
}
