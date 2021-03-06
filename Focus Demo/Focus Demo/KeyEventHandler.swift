//
//  KeyEventHandler.swift
//  Focus Demo
//
//  Created by Jason Barrie Morley on 07/12/2020.
//

import SwiftUI

struct KeyDownHandlersKey: EnvironmentKey {
    static var defaultValue: [(NSEvent) -> Bool] = []
}

struct KeyUpHandlersKey: EnvironmentKey {
    static var defaultValue: [(NSEvent) -> Bool] = []
}

extension EnvironmentValues {

    var keyDownHandlers: [(NSEvent) -> Bool] {
        get { self[KeyDownHandlersKey.self] }
        set { self[KeyDownHandlersKey.self] = newValue }
    }

    var keyUpHandlers: [(NSEvent) -> Bool] {
        get { self[KeyUpHandlersKey.self] }
        set { self[KeyUpHandlersKey.self] = newValue }
    }

}

struct KeyEventHandler: ViewModifier {

    @Environment(\.keyDownHandlers) var environmentKeyDownHandlers
    @Environment(\.keyUpHandlers) var environmentKeyUpHandlers

    var keyDownHandlers: [(NSEvent) -> Bool] = []
    var keyUpHandlers: [(NSEvent) -> Bool] = []

    init(onKeyDown: ((NSEvent) -> Bool)? = nil, onKeyUp: ((NSEvent) -> Bool)? = nil) {
        if let onKeyDown = onKeyDown {
            keyDownHandlers.append(onKeyDown)
        }
        if let onKeyUp = onKeyUp {
            keyUpHandlers.append(onKeyUp)
        }
    }

    func body(content: Content) -> some View {
        content
            .environment(\.keyDownHandlers, keyDownHandlers + environmentKeyDownHandlers)
            .environment(\.keyUpHandlers, keyUpHandlers + environmentKeyUpHandlers)
    }

}

extension View {

    func onKeyDown(handler: @escaping (NSEvent) -> Bool) -> some View {
        modifier(KeyEventHandler(onKeyDown: handler))
    }

    func onKeyUp(handler: @escaping (NSEvent) -> Bool) -> some View {
        modifier(KeyEventHandler(onKeyUp: handler))
    }

    func onKey(_ characters: String, perform: @escaping () -> Void) -> some View {
        modifier(KeyEventHandler(onKeyDown: { event -> Bool in
            guard event.characters == characters else {
                return false
            }
            perform()
            return true
        }, onKeyUp: { event -> Bool in
            guard event.characters == characters else {
                return false
            }
            return true
        }))
    }

    func onSelectCommand(perform: @escaping () -> Void) -> some View {
        onKey(" ", perform: perform)
    }

    func onEnterCommand(perform: @escaping () -> Void) -> some View {
        onKey("\r", perform: perform)
    }

}
