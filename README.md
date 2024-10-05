[![Tests](https://github.com/sentryco/PinView/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/PinView/actions/workflows/Tests.yml)

# PinView

> A sleek PinCodeView for iOS and macOS

<img width="290" alt="img" src="https://s11.gifyu.com/images/SBTf3.gif">

PinView is a custom SwiftUI view designed to simplify the input of PIN codes in iOS and macOS apps. It's highly customizable to fit the look and feel of your application.

## Features

- **Customizable appearance:** Change colors, fonts, and sizes.
- **Support for iOS and macOS:** Seamlessly integrate with your projects across Apple platforms.
- **Haptic feedback:** Provide physical feedback as users type the pin.
- **Accessibility support:** Fully accessible to visually impaired users.


## Example:
```swift
struct ContentView: View {
    @State private var pinCode: String = ""

    var body: some View {
        PinView(pin: $pinCode, length: 4) // Set the length of the PIN code
            .padding()
            .onPinEntered { enteredPin in
                print("Entered PIN: \(enteredPin)")
            }
    }
}
```

## License

PinView is available under the MIT license. See the LICENSE file for more info.
