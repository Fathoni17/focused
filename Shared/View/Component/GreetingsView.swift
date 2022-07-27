//
//  GreetingsView.swift
//  focused
//
//  Created by Fathoni on 28/07/22.
//

import SwiftUI

struct GreetingsView: View {
    var body: some View {
        #if os(iOS)
        VStack(alignment: .leading) {
            // TODO: Change to dynamic Name input
            Greatings(name: "Muhammad Fathoni")
            Divider()
            HStack {
                Text("Your\nFocus Level")
                    .font(.subheadline)
                    .foregroundColor(.primary.opacity(0.6))
                Spacer()
                // TODO: Change to dynamic Focus Level
                FocusLevel(level: 2.5)
            }
            .padding(.vertical, 20)
            Divider()
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
        #elseif os(macOS)
        HStack(alignment: .lastTextBaseline) {
            // TODO: Change to dynamic Name input
            Greatings(name: "Muhammad Fathoni")
            Spacer()
            VStack {
                Text("Your Focus Level")
                // TODO: Change to dynamic Focus Level
                FocusLevel(level: 2.5)
            }
        }
        .padding(.horizontal, 20)
        .padding(.vertical, 10)
        #endif
    }
    
    func Greatings(name: String) -> some View {
        VStack(alignment: .leading){
            Text("Welcome back,")
            Text(name)
                .font(.title)
                .fontWeight(.semibold)
        }
    }
    
    func FocusLevel(level: Float) -> some View {
        HStack {
            Text("\(level, specifier: "%.1f")h")
                .font(.title2)
            Text("🔥")
                .font(.custom("FireIcon", fixedSize: 32))
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 20)
        .background(.red.opacity(0.4))
        .cornerRadius(8)
    }
}

struct GreetingsView_Previews: PreviewProvider {
    static var previews: some View {
        GreetingsView()
    }
}
