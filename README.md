# swiftui-focus-demo

Demo app created to play around with SwiftUI and focus on macOS

## Introduction

This is a collection of experiments created to try to understand how focus and keyboard input behaves in SwiftUI, specificaly on macOS.

## Learnings

In the process of playing around with this, I've come across a collection of learnings that aren't easily captured in the code:

- `.focusable` only seems to work to make non-selectable items (`View`, `Button`, etc) tab-selectable (focusable) when the 'Use keyboard navigation to move focus between controls' is selected in System Preferences; I was surprised to see it doesn't even work for buttons, given what the documentation says.
- Hosted `NSView` instances that return `true` to `acceptsFirstResponder` can be 'focussed' on macOS, meaning that modifiers like `.onMoveCommand` and `.onExitCommand` then work (see `ResponderView` and `SelectableCounter` for examples of how this can be used to handle keyboard events on a 'native' SwiftUI component).
