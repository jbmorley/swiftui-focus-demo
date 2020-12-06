# swiftui-focus-demo

Demo app created to play around with SwiftUI and focus on macOS

## Introduction

This is a collection of experiments created to try to understand how focus and keyboard input behaves in SwiftUI, specificaly on macOS.

## Thoughts and Learnings

In the process of playing around with this, I've come across a collection of learnings that aren't easily captured in the code:

- `.focusable` only seems to work to make non-selectable items (`View`, `Button`, etc) tab-selectable (focusable) when the 'Use keyboard navigation to move focus between controls' is selected in System Preferences; I was surprised to see it doesn't even work for buttons, given what the documentation says.
- Hosted `NSView` instances that return `true` to `acceptsFirstResponder` can be 'focussed' on macOS, meaning that modifiers like `.onMoveCommand` and `.onExitCommand` then work (see `ResponderView` and `SelectableCounter` for examples of how this can be used to handle keyboard events on a 'native' SwiftUI component).
- `.focusable` is confusing in part because it describes only a very low-level UX semantic concept; it describes the idea that there is always a single focused item on screen. It should not be confused with 'selection', which allows for multiple items to be selected at once, or 'highlighting'.
   - It becomes consuing on macOS because the mechanism to change focus (using keyboard and mouse) is the exact same mechanism used to navigate through the elements on screen
   - One might expect the  `.focusable` modifier to make a UI element selectable in this way (to allow it to select keyboard input), indeed, when one tabs around a Mac app, one is moving 'focus' from element to element. I argue that there needs to be another term to capture the top-level blocks or 'contexts' the user is engaging with.
- The language around focus just seems to be 'wrong' on macOS; on TV OS, it seems to be a proxy for selection, moving between selected buttons / shows using the remote, where the OS walks the view heirarchy to determine the selection. Tabs? Multi-selection? Highlight?
