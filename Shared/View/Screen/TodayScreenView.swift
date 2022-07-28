//
//  TodayScreenView.swift
//  focused (iOS)
//
//  Created by Fathoni on 28/07/22.
//

import SwiftUI

struct TodayScreenView: View {
    @ObservedObject var taskVM: TaskViewModel
    @State var isAddSheetOpen: Bool = false
    
    var body: some View {
        VStack(spacing: 0) {
            GreetingsView()
                .padding(.top, 12)
            
            List {
                Section {
                    ForEach(taskVM.tasks) {
                        TaskListItems(title: $0.title, count: $0.pomodoroCount)
                    }
                } header: {
                    HStack {
                        Text("Today's Tasks")
                        
                        Spacer()
                        
                        //EditButton() // TODO: will implemented letter
                        Button {
                            isAddSheetOpen = true
                        } label: {
                            Image(systemName: "plus")
                        }
                        
                        .padding(.all, 4)
                        // MARK: - Popover and sheet for inputing new task
                        #if os(macOS)
                        .popover(isPresented: $isAddSheetOpen, content: {
                            NewTaskSheetView(showModal: $isAddSheetOpen)
                        })
                        #elseif os(iOS)
                        .sheet(isPresented: $isAddSheetOpen, content: {
                            NewTaskSheetView(showModal: $isAddSheetOpen)
                        })
                        #endif
                        // MARK: END-
                    }
                }
            }
                .listStyle(.inset)
                #if os(iOS)
                .navigationBarHidden(true)
                #endif
            
        }
    }
}

struct TodayScreenView_Previews: PreviewProvider {
    static var previews: some View {
        TodayScreenView(taskVM: TaskViewModel())
    }
}
