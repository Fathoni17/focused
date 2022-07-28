//
//  WelcomeScreen.swift
//  focused (macOS)
//
//  Created by Fathoni on 28/07/22.
//

import SwiftUI

struct WelcomeScreen: View {
    var body: some View {
        VStack {
            Text("🔥")
                .font(.system(size: 80))
                .padding(.bottom, 10)
            Text("Lets Focus to Your Task!")
                .font(.title)
            Text("👈🏻  Check Your Today's Tasks")
                .font(.body)
                .fontWeight(.regular)
                .foregroundColor(.primary.opacity(0.6))
                .padding(.top, 1)
        }
    }
}

struct WelcomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeScreen()
    }
}
