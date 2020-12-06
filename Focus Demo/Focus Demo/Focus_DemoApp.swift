//
//  Focus_DemoApp.swift
//  Focus Demo
//
//  Created by Jason Barrie Morley on 06/12/2020.
//

import SwiftUI

@main
struct Focus_DemoApp: App {

    @FocusedBinding(\.count) var count: Int?

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .commands {
            CommandMenu("Experiments") {

                Button {
                    guard let count = count else {
                        print("Element not selected.")
                        return
                    }
                    print("Count: \(count)")
                } label: {
                    Text("Print Selected Count")
                }
                .disabled($count.wrappedValue == nil)

            }
        }
    }
}
