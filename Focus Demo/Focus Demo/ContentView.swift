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
                .onKeyDown { event -> Bool in
                    if event.characters == "a" {
                        print("a pressed")
                        return true
                    }
                    return false
                }
                .onKeyUp { event -> Bool in
                    if event.characters == "b" {
                        print("b pressed")
                        return true
                    }
                    return false
                }
            SelectableText("Static text")
                .padding()
                .onEnterCommand {
                    print("on enter")
                }
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
                Text("Try clicking or tabbing around, or pressing escape.")
                    .font(.caption)
            }
            .padding()
        }
        .frame(minWidth: 300, maxWidth: 300)
    }
}
