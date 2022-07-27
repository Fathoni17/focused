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
        let dataTask: [String] = [
            "Sketch Phone App LoFi",
            "Design Mac App",
            "Complating Copywriting",
            "Uploading Assets",
            "Gether color palet inspiration"
        ]

        dataTask.forEach { title in
            self.tasks.append(TaskModel(id: title, title: title))
        }
        
        self.tasks.forEach { task in
            if task.elapsedTime != nil {
                self.histories.append(task)
            }
        }
    }
    
}
