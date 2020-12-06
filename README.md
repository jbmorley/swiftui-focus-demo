# swiftui-focus-demo

Demo app created to play around with SwiftUI and focus on macOS

## Introduction

This is a collection of experiments created to try to understand how focus and keyboard input behaves in SwiftUI, specificaly on macOS.

## Learnings

In the process of playing around with this, I've come across a collection of learnings that aren't easily captured in the code:

- `.focusable` only seems to work to make non-selectable items (`View`, `Button`, etc) tab-selectable (focusable) when the 'Use keyboard navigation to move focus between controls' is selected in System Preferences. (This is pretty unhelpful, and I was incredibly surprised to see it doesnt' work even for buttons, given documentation.)
