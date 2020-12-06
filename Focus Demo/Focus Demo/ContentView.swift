//
//  ContentView.swift
//  Focus Demo
//
//  Created by Jason Barrie Morley on 06/12/2020.
//

import SwiftUI

struct ContentView: View {

    @FocusedBinding(\.count) var count: Int?
    @State var contents: String = ""

    var body: some View {
        VStack {
            SelectableCounter()
                .padding()
            SelectableText("Static text")
                .padding()
            TextField("Click to select", text: $contents)
                .padding()
            VStack {
                Button {
                    print("Button clicked")
                } label: {
                    Text("Click me")
                }
                Text("Buttons don't appear to be focusable on macOS even with the .focusable modifier.")
                    .lineLimit(10)
                    .font(.caption)
            }
            .padding()
            VStack {
                Text(count != nil ? "Selected value: \(count!)" : "Counter not selected")
                Text("Try clicking or tabbing around.")
                    .font(.caption)
            }
            .padding()
        }
        .frame(minWidth: 300, maxWidth: 300)
    }
}
