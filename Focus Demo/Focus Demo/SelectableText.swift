//
//  SelectableText.swift
//  Focus Demo
//
//  Created by Jason Barrie Morley on 06/12/2020.
//

import SwiftUI

struct SelectableText: View {

    @State var content: String
    @State var firstResponder: Bool = false

    init(_ content: String) {
        _content = State(initialValue: content)
    }

    var body: some View {
        VStack {
            Text(content)
            Text("Click to Select")
                .font(.caption)
        }
        .frame(minWidth: 100)
        .padding()
        .background(firstResponder ? Color.purple : Color.clear)
        .cornerRadius(6)
        .overlay(RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.purple, lineWidth: 2))
        .foregroundColor(firstResponder ? .white : .black)
        .onTapGesture {
            firstResponder = true
        }
        .acceptsFirstResponder(isFirstResponder: $firstResponder)
    }

}
