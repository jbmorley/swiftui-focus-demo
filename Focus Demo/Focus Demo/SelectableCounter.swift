//
//  SelectableCounter.swift
//  Focus Demo
//
//  Created by Jason Barrie Morley on 06/12/2020.
//

import SwiftUI

struct SelectableCounter: View {

    @State var value: Int = 0
    @State var firstResponder: Bool = false

    var body: some View {
        VStack {
            Text("\(value)")
            Text("Click to Select")
                .font(.caption)
        }
        .frame(minWidth: 100)
        .padding()
        .background(firstResponder ? Color.pink : Color.clear)
        .cornerRadius(6)
        .overlay(RoundedRectangle(cornerRadius: 6)
                    .stroke(Color.pink, lineWidth: 2))
        .acceptsFirstResponder(isFirstResponder: $firstResponder)
        .foregroundColor(firstResponder ? .white : .black)
        .onTapGesture {
            firstResponder = true
        }
        .focusedValue(\.count, $value)
        .onMoveCommand { direction in
            print(direction)
            switch direction {
            case .up:
                value += 1
            case .down:
                value -= 1
            default:
                return
            }
        }
        .onExitCommand {
            firstResponder = false
        }
    }
}

struct FocusedCounterValueKey : FocusedValueKey {
    typealias Value = Binding<Int>
}

extension FocusedValues {

    var count: FocusedCounterValueKey.Value? {
        get { self[FocusedCounterValueKey.self] }
        set { self[FocusedCounterValueKey.self] = newValue }
    }

}
