//
//  HistoryScreenView.swift
//  focused
//
//  Created by Fathoni on 28/07/22.
//

import SwiftUI

struct HistoryScreenView: View {
    @ObservedObject var taskVM: TaskViewModel

    var body: some View {
        VStack(alignment: .leading, spacing: 0) {
            #if os(macOS)
            Text("Histories")
                .font(.title2)
                .padding(.horizontal)
                .padding(.top, 30)
            #endif
            List {
                #if os(iOS)
                Section {
                    ForEach(taskVM.tasks) {
                        Text($0.title)
                        #if os(macOS)
                            .padding(.vertical, 2)
                        #endif
                    }
                }
                #elseif os(macOS)
                Section {
                    ForEach(taskVM.tasks) {
                        Text($0.title)
                        #if os(macOS)
                            .padding(.vertical, 2)
                        #endif
                    }
                } header: {
                    Text("You have done well!  👊🏻")
                }
                #endif
                
            }

            .listStyle(.inset)
            .navigationTitle("Histories")
            #if os(iOS)
            .navigationBarTitleDisplayMode(.large)
            .navigationBarHidden(false)
#endif
        }
    }
}

struct HistoryScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryScreenView(taskVM: TaskViewModel())
    }
}
