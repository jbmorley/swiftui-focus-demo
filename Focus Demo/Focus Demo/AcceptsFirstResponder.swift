//
//  AcceptsFirstResponder.swift
//  Focus Demo
//
//  Created by Jason Barrie Morley on 06/12/2020.
//

import SwiftUI

struct keyDownHandlersKey: EnvironmentKey {
    static var defaultValue: [(NSEvent) -> Bool] = []
}

extension EnvironmentValues {
    var keyDownHandlers: [(NSEvent) -> Bool] {
        get { self[keyDownHandlersKey.self] }
        set { self[keyDownHandlersKey.self] = newValue }
    }
}

struct KeyDownHandler: ViewModifier {

    @Environment(\.keyDownHandlers) var keyDownHandlers

    var onKeyDown: (NSEvent) -> Bool

    func body(content: Content) -> some View {
        content.environment(\.keyDownHandlers, [onKeyDown] + self.keyDownHandlers)
    }

}

extension View {

    func onKeyDown(handler: @escaping (NSEvent) -> Bool) -> some View {
        return modifier(KeyDownHandler(onKeyDown: handler))
    }

}


struct AcceptsFirstResponder: ViewModifier {

    @Binding var isFirstResponder: Bool

    func body(content: Content) -> some View {
        content
            .background(ResponderView(firstResponder: $isFirstResponder)
                            .onKeyDown(handler: { event in
                                if event.characters == " " {
                                    print("onKeyDown: \(event)")
                                    return true
                                }
                                return false
                            }))
    }

}

extension View {

    func acceptsFirstResponder(isFirstResponder: Binding<Bool>) -> some View {
        return self
            .modifier(AcceptsFirstResponder(isFirstResponder: isFirstResponder))
    }

}

