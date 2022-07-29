//
//  CountdownCircle.swift
//  focused
//
//  Created by Fathoni on 29/07/22.
//

import SwiftUI

let timer = Timer
    .publish(every: 1, on: .main, in: .common)
    .autoconnect()

struct CountdownCircle: View {
    @State var task: TaskModel
    @Binding var isResting: Bool
    var onDone: () -> Void
    @Binding var counter: Int
    var countTo: Int = 25*60 //4 minutes 120 - 2minutes

    @EnvironmentObject var taskVM: TaskViewModel
    var body: some View {
        VStack{
            ZStack{
                Circle()
                    .fill(Color.clear)
                    .frame(width: 250, height: 250)
                    .overlay(
                        Circle().stroke(isResting ? Color("tertiaryContainer") : Color("inversePrimary"), lineWidth: 20)
                    )
                
                Circle()
                    .fill(Color.clear)
                    .frame(width: 250, height: 250)
                    .overlay(
                        Circle().trim(from:0, to: progress())
                            .stroke(
                                style: StrokeStyle(
                                    lineWidth: 20,
                                    lineCap: .round,
                                    lineJoin:.round
                                )
                            )
                            .foregroundColor(
                                (isResting ? Color("onTertiaryContainer") : Color("primary"))
                            ).animation(.easeInOut(duration: 0.2), value: counter)
                    )
                    .rotationEffect(.degrees(-90))

                Clock(counter: counter, countTo: countTo, resting: isResting)
            }
        }.onReceive(timer) { time in
            if (self.counter < self.countTo) {
                self.counter += 1
            }
            if self.counter == self.countTo {
                if !isResting {
                    taskVM.continueForResting(task: task)
                    isResting = true
                    counter = 0
                } else {
                    onDone()
                }
            }
        }
    }
    
    func completed() -> Bool {
        return progress() == 1
    }
    
    func progress() -> CGFloat {
        return (CGFloat(counter) / CGFloat(countTo))
    }
}

struct Clock: View {
    var counter: Int
    var countTo: Int
    var resting: Bool
    
    var body: some View {
        VStack {
            Text(counterToMinutes())
                .font(.system(size: 60))
                .fontWeight(.black)
                .foregroundColor(resting
                    ? Color("onTertiaryContainer")
                    : Color("primary")
                )
        }
    }
    
    func counterToMinutes() -> String {
        let currentTime = countTo - counter
        let seconds = currentTime % 60
        let minutes = Int(currentTime / 60)
        
        return "\(minutes):\(seconds < 10 ? "0" : "")\(seconds)"
    }
}

struct CountdownCircle_Previews: PreviewProvider {
    @State static var resting: Bool = false
    static var previews: some View {
        CountdownCircle(task: TaskModel(title: "Testing"), isResting: $resting, onDone: {}, counter: .constant(0) )
    }
}
