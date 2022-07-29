//
//  PomodoroTimer.swift
//  focused (iOS)
//
//  Created by Fathoni on 29/07/22.
//

import SwiftUI

struct PomodoroTimer: View {
    @EnvironmentObject var taskVM: TaskViewModel
    @State var task: TaskModel
    @State var countdownMinutes: Int = 2
    @State var counter: Int = 0

    var body: some View {
        VStack(spacing: 50) {
            if task.isResting {
                Text("Take a break 👊🏻")
                    .font(.title2)
                    .fontWeight(.semibold)
            } else {
                Text("On Focus! 🔥")
                    .font(.title2)
                    .fontWeight(.semibold)
            }
            CountdownCircle(counter: 0, countTo: (task.isResting ? 5 : countdownMinutes) * 60)
            Text(task.title)
                .font(.title)
            Button("Mark as done") {
                counter = counter + 60
            }
            .padding()
            .padding(.horizontal, 20)
            .background(.red.opacity(0.3))
            .cornerRadius(16)
        }
    }
}

struct PomodoroTimer_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroTimer(task: TaskModel(title: "Testing"))
            .environmentObject(TaskViewModel())
    }
}
