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
    var pomodoroCount: Int = 0
    var lastPomodoroStartedAt: Date?
    var isResting: Bool = false
    var isStillEfective: Bool = true
    var elapsedTime: Int?
    var isDone: Bool = false
    
    init(title: String) {
        self.id = UUID().uuidString
        self.title = title
    }
}
