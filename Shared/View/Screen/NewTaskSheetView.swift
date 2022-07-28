//
//  NewTask.swift
//  focused
//
//  Created by Fathoni on 28/07/22.
//

import Foundation
import SwiftUI

struct NewTaskSheetView: View {
    @Binding var showModal: Bool

    @Environment(\.presentationMode) private var presentationMode

    @State var newTaskTitle: String = ""

    var body: some View {
        NavigationView {
            HStack(alignment: .center) {
                VStack(alignment: .center) {
                    #if os(macOS)
                    Text("Add new task title")
                    #endif
                    TextField("Task title", text: $newTaskTitle)
                        .textFieldStyle(.roundedBorder)

                    #if os(iOS)
                    Spacer()
                    #elseif os(macOS)
                    HStack {
                        cancelButton()
                        addButton()
                    }
                        .padding()
                    #endif
                }
                #if os(macOS)
                .padding(.horizontal, 30)
                #elseif os(iOS)
                .padding(.horizontal)
                .navigationTitle("Add new task")
                .navigationBarTitleDisplayMode(.inline)
                .navigationBarItems(
                    leading: cancelButton(),
                    trailing: addButton()
                )
                #endif
            }
        }
    }
    
    func cancelButton() -> some View {
        Button("Cancel") {
            self.showModal.toggle()
            self.presentationMode.wrappedValue.dismiss()
        }
    }
    func addButton() -> some View {
        Button("Add") {
            self.showModal.toggle()
        }
    }
}

struct NewTask_Previews: PreviewProvider {
    @State static var show = false
    static var previews: some View {
        NewTaskSheetView(showModal: $show)
    }
}
