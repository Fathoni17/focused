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
    var elapsedTime: UInt?
    var pomodoroCount: UInt?
    var isDone: Bool?
}
