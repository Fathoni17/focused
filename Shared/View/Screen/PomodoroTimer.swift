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
    @State var countdownMinutes: Int = 1
    @State var isResting: Bool = false
    @State var sessionEnd: Bool = false
    @State var counter: Int = 0

    @Environment(\.presentationMode) private var presentationMode

    var body: some View {
        VStack(spacing: 50) {
            if isResting {
                Text("Take a break 👊🏻")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("onTertiaryContainer"))
            } else {
                Text("On Focus! 🔥")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .foregroundColor(Color("primary"))
            }
            CountdownCircle(task: task, isResting: $isResting, onDone: {
                sessionEnd = true
            }, counter: $counter, countTo: (isResting ? 15 : countdownMinutes * 60) )
            Text(!isResting ? task.title : "Break time 🎉")
                .font(.title)
                .foregroundColor(isResting ? Color("onTertiaryContainer") : Color("primary"))
            VStack {
                if sessionEnd {
                    Button("Continue") {
                        isResting = false
                        sessionEnd = false
                        counter = 0
                        taskVM.startPomodoro(task: task)
                    }
                    .foregroundColor(isResting ? Color("onTertiaryContainer") : Color("onSecondaryContainer"))
                    .padding()
                    .padding(.horizontal, 16)
                    .frame(minWidth: 120)
                    .background(isResting ? Color("tertiaryContainer") : Color("secondaryContainer"))
                    .cornerRadius(40)
                }

                Button("Mark as done") {
                    if isResting {
                        taskVM.markAsDone(task: task)
                        isResting = false
                        self.presentationMode.wrappedValue.dismiss()
                    } else {
                        isResting = true
                    }
                }
                .foregroundColor(isResting ? Color("onTertiaryContainer") : Color("onSecondaryContainer"))
                .padding()
                .padding(.horizontal, 16)
                .frame(minWidth: 120)
                .background(isResting ? Color("tertiaryContainer") : Color("secondaryContainer"))
                .cornerRadius(40)
            }
        }
    }
}

struct PomodoroTimer_Previews: PreviewProvider {
    static var previews: some View {
        PomodoroTimer(task: TaskModel(title: "Testing"))
            .environmentObject(TaskViewModel())
    }
}
