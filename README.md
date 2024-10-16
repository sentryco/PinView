[![Tests](https://github.com/sentryco/PinView/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/PinView/actions/workflows/Tests.yml)

# PinView

> A sleek PinCodeView for iOS and macOS

<img width="290" alt="img" src="https://s11.gifyu.com/images/SBTf3.gif">

PinView is a custom SwiftUI view designed to simplify the input of PIN codes in iOS and macOS apps. It's highly customizable to fit the look and feel of your application.

## Features

- **Light / dark mode support** Apperance is automatically adjusted to the OS settings.
- **Support for iOS and macOS:** Seamlessly integrate with your projects for iPhone, iPad, Mac
- **Haptic feedback:** Provide physical feedback as users type the pin.
- **Supports custom pin length:** Set the length of the pin code to your needs.
- **Automatic textfield focus change:** Automatically focuses the next textfield when the current one is filled.

## Example:
```swift
struct ContentView: View {
    @State private var pinCode: String = ""

    var body: some View {
        PinCodeView(count: 4) { pin in
            Swift.print("On verify - pin: \(pin)")
        }
    }
}
```

## Swift Package Manager (SPM)

```swift
.package(url: "https://github.com/sentryco/PinView", branch: "main")
```

### Future improvements:

1. **Focus Management & Backspace Functionality**
   - Improve focus transitions and add backspace functionality for smooth user input.

2. **Obfuscation Feature**
   - Implement PIN obfuscation to enhance security and user privacy. (Add obfuscation after iterating through pins)

3. **Refactoring & Code Organization**
   - Refactor code for better modularity and readability.

4. **Accessibility Improvements**
   - Review and improve accessibility features, including voice-over compatibility.

5. **Preview & Testing Enhancements**
   - Expand preview functionality to cover more scenarios for better UI testing.
   - Add note about limits with Preview vs Simulator vs Device 

6. **Styling & Theming Consistency**
   - Use constants for styling values to ensure consistent theming.

7. **Documentation & Code Comments**
   - Address TODOs and FIXMEs related to documentation for better clarity and collaboration.

8. **Miscellaneous**
   - Add note regarding textfield position changing when keyboard is shown / dismissed etc
   - Rename repo to PinCodeView?