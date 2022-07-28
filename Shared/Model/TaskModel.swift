//
//  TaskModel.swift
//  focused (iOS)
//
//  Created by Fathoni on 28/07/22.
//

import Foundation

struct TaskModel: Hashable, Identifiable {
    var id: String
    var title: String
    var elapsedTime: Int?
    var pomodoroCount: Int = 0
    var isDone: Bool = false
    
    init(title: String) {
        self.id = UUID().uuidString
        self.title = title
    }
}
