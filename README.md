# BBC News Test iOS APP

This is test project for BBC News. I've finished the app in circa **4 hours**. 

In this project, I tried to experiment by using child controllers as some kind of **plugin controllers** for better decomposition of the scene. 

Each child controller (plugin) has it's own responsibility (populated state, error state, and loading state). Parent view controller is just switching between states. I see space for improvements, but I see big potential in **easy scaling**. 

### Dependencies

As recommended, I haven't use any dependencies. Anyway, I usually use following:

- **AKit**, my own library containing all boilerplate code I'm using across my projects.
  - https://github.com/adam-leitgeb/AKit-iOS
- **BartyCourch**, for easier work with localization.
  - https://github.com/Flinesoft/BartyCrouch
- **PromiseKit**, for easier work with asynchronous operations.
  - https://github.com/mxcl/PromiseKit
- **SwiftLint**, for incremental updates of a Strings files from the Code.
  - https://github.com/realm/SwiftLint