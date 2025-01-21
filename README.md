[![Tests](https://github.com/sentryco/PinView/actions/workflows/Tests.yml/badge.svg)](https://github.com/sentryco/PinView/actions/workflows/Tests.yml)
[![codebeat badge](https://codebeat.co/badges/f1161517-1999-4386-9377-ab552fdf7655)](https://codebeat.co/projects/github-com-sentryco-pinview-main)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT) [![Swift 5.9](https://img.shields.io/badge/Swift-5.9-orange.svg)](https://swift.org) [![Platform: iOS/macOS](https://img.shields.io/badge/platform-iOS%20%2F%20macOS-blue.svg)](https://www.apple.com/ios/)


# PinView

> A sleek PinCodeView for iOS and macOS

<img width="290" alt="img" src="https://s11.gifyu.com/images/SBTf3.gif">

PinView is a custom SwiftUI view designed to simplify the input of PIN codes in iOS and macOS apps. It's highly customizable to fit the look and feel of your application.

## Features

- 🌗 **Light / dark mode support:** Appearance is automatically adjusted to the OS settings.
- 🔢 **Supports custom pin length:** Set the length of the pin code to your needs.
- 🔄 **Automatic textfield focus change:** Automatically focuses the next textfield when the current one is filled.

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
   - Improve focus transitions and add backspace functionality.

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
   - Remove unit-tests. And add UI-tests?

### Todo: 
- Add top-level styling options through ViewBuilder + Style param drilling or environment variable
- Implement Backspace Functionality in PinCodeView
Currently, the PinCodeView does not handle backspacing to delete digits and move focus backward, which is an essential feature for user input fields.
Improvement:
Modify the onChange handler in PinView to detect when the text field is empty and shift focus to the previous field.
Example Update in PinView+Content.swift:

```swift
.onChange(of: pinValues[pin.fieldId]) { newVal in
    if newVal.isEmpty {
        // Move focus to the previous pin if backspacing
        if pin.fieldId > 0 {
            self.pinFocusState = .fieldId(pin.fieldId - 1)
        }
    } else if newVal.count == 1 && newVal.first?.isNumber == true {
        // Move focus to the next pin
        if let nextPin = self.nextPin {
            self.pinFocusState = nextPin
        } else {
            // Dismiss keyboard if last field is filled
            self.pinFocusState = nil
        }
    }
}
```

- Implement PIN Obfuscation Feature
To enhance security and privacy, it's important to obfuscate the PIN code as the user types, preventing shoulder surfing.
Improvement:
Replace TextField with SecureField to automatically obscure the input.
If SecureField doesn't suit your needs (since it hides the entire input), consider manually replacing the entered character with a masking character like "●".
Example Update in PinView+Content.swift:

```swift
TextField("", text: Binding(
    get: { pinValues[pin.fieldId] },
    set: { newValue in
        pinValues[pin.fieldId] = newValue.isEmpty ? "" : "●"
    }
)) { isEditing in
    self.editing = isEditing
}
```

Note: You might need to store the actual PIN in a separate variable to use for verification, as this approach modifies the displayed text.

- Improve Accessibility Support
Enhancing accessibility ensures that your app is usable by a wider range of users, including those who rely on assistive technologies.
Improvements:
Add meaningful accessibilityLabel and accessibilityHint to views.
Use accessibilityValue to convey the current state of the input fields.
Ensure focus order is logical for VoiceOver users.
Example Update in PinView+Content.swift:

```
TextField("", text: $pinValues[pin.fieldId]) { isEditing in
    self.editing = isEditing
}
.accessibilityLabel("PIN Digit \(pin.fieldId + 1)")
.accessibilityHint("Enter the \(ordinal(pin.fieldId + 1)) digit of your PIN code")
.accessibilityValue(pinValues[pin.fieldId].isEmpty ? "Empty" : "Filled")

func ordinal(_ number: Int) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .ordinal
    return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
}
```

- Refactor Code for Better Modularity
Several Fixme comments suggest moving constants to a constants library and consolidating similar code.
Improvements:
Create a Constants struct or enum to house commonly used constants.
Extract repeated code into reusable functions or view modifiers.
Example of a Constants File:

```
import SwiftUI

struct Constants {
    static let pinFieldWidth: CGFloat = 45
    static let pinFieldHeight: CGFloat = 45
    static let pinFieldSpacing: CGFloat = 15
    static let cornerRadius: CGFloat = 5
    // Add other constants as needed
}
```
- Enhance Preview Providers
Previews are a powerful tool for UI development in SwiftUI.
Improvements:
Use different devices and orientations in previews to ensure responsiveness.
Leverage ForEach to preview multiple scenarios.
Example Update in PinCodeView+Preview.swift:

```
#Preview {
    ForEach(["iPhone SE (3rd generation)", "iPhone 14 Pro Max", "iPad Pro (12.9-inch)"], id: \.self) { deviceName in
        PinCodeView(count: 4) { pin in
            Swift.print("On verify - pin: \(pin)")
        }
        .previewDevice(PreviewDevice(rawValue: deviceName))
        .previewDisplayName(deviceName)
    }
}
```

-  Organize Styles and Components
Improving the structure of your codebase makes it easier to navigate and maintain.
Improvements:
Group styles into a Styles directory.
Ensure that related components are grouped together.
Remove redundant or unused files.
Example Directory Structure:

```
Sources/
├── PinView/
│   ├── Components/
│   │   ├── PinCodeView.swift
│   │   ├── PinView.swift
│   │   └── ...
│   ├── Styles/
│   │   ├── PinStyle.swift
│   │   ├── PinTitleTextStyle.swift
│   │   └── ...
│   └── Utils/
│       ├── Constants.swift
│       └── ...
```

- Leverage Built-in Text Field Styles
While custom styles offer flexibility, using built-in styles can reduce code complexity.
Improvement:
Explore SwiftUI's built-in TextFieldStyle options.
Use modifiers like .textContentType(.oneTimeCode) to hint at the expected input.
Example Update in PinView+Content.swift:

```
TextField("", text: $pinValues[pin.fieldId])
    .textFieldStyle(RoundedBorderTextFieldStyle())
    .keyboardType(.numberPad)
    .textContentType(.oneTimeCode)
    // Existing modifiers...
```

Note: Be cautious as some styles and content types may not fit the exact needs of a PIN input field.

- Add Clipboard Paste Support
Allow users to paste a complete PIN code into the input fields.

```
// Inside your PinCodeView
.onChange(of: UIPasteboard.general.string) { newValue in
    guard let pastedString = newValue, pastedString.count == self.count else { return }
    for (index, character) in pastedString.enumerated() {
        if index < self.pin.count {
            self.pin[index] = String(character)
        }
    }
    self.pinFocusState = .fieldId(self.count - 1)
}
```

- Enhance Accessibility Support
Improve support for VoiceOver and Dynamic Type to make your app accessible to more users.
```
TextField("", text: $pinValues[pin.fieldId])
    .accessibilityLabel("Digit \(pin.fieldId + 1) of \(self.count)")
    .accessibilityValue(pinValues[pin.fieldId].isEmpty ? "Empty" : "Filled")
    .font(.preferredFont(forTextStyle: .title1))
    .environment(\.sizeCategory, .accessibilityLarge)
```

- Add Customization Through Themable Styles
Allow developers to customize the appearance by introducing themable styles.

```
import SwiftUI

public struct PinCodeViewStyle {
    public var fieldSize: CGSize
    public var fieldSpacing: CGFloat
    public var activeBorderColor: Color
    public var inactiveBorderColor: Color
    public var textColor: Color
    public var font: Font

    public init(
        fieldSize: CGSize = CGSize(width: 45, height: 45),
        fieldSpacing: CGFloat = 15,
        activeBorderColor: Color = .blue,
        inactiveBorderColor: Color = .gray,
        textColor: Color = .primary,
        font: Font = .title
    ) {
        self.fieldSize = fieldSize
        self.fieldSpacing = fieldSpacing
        self.activeBorderColor = activeBorderColor
        self.inactiveBorderColor = inactiveBorderColor
        self.textColor = textColor
        self.font = font
    }
}
```
Use the style in your PinCodeView:

```
public struct PinCodeView: View {
    // Existing properties
    let style: PinCodeViewStyle

    public init(
        count: Int,
        style: PinCodeViewStyle = PinCodeViewStyle(),
        titles: Titles = PinCodeView.defaultTitles,
        onVerify: OnVerify? = nil
    ) {
        self.count = count
        self.style = style
        self.titles = titles
        self.onVerify = onVerify
        self._pin = State(initialValue: Array(repeating: "", count: count))
    }

    // Pass `style` down to your subviews
}
```
Apply the style in PinView:

```
TextField("", text: $pinValues[pin.fieldId])
    .frame(width: style.fieldSize.width, height: style.fieldSize.height)
    .background(Color.clear)
    .overlay(
        RoundedRectangle(cornerRadius: 5)
            .stroke(isFocused ? style.activeBorderColor : style.inactiveBorderColor, lineWidth: 2)
    )
    .font(style.font)
    .foregroundColor(style.textColor)
```

-  Implement Error Handling and Validation
Provide feedback for invalid PIN entries.

```
@State private var isError = false
@State private var errorMessage = "Invalid PIN. Please try again."

var body: some View {
    VStack {
        // ... existing code
        if isError {
            Text(errorMessage)
                .foregroundColor(.red)
                .font(.caption)
        }
    }
}

func verifyPin() {
    let enteredPin = pin.joined()
    if isValidPin(enteredPin) {
        onVerify?(enteredPin)
    } else {
        isError = true
        // Provide haptic feedback for error
        HapticManager.notification(type: .error)
    }
}
```

- Add Animation Effects
Incorporate animations to improve user experience.

```
// Animate focus change
.withAnimation {
    self.pinFocusState = self.nextPin
}

// Shake animation on error
if isError {
    TextField("", text: $pinValues[pin.fieldId])
        .modifier(ShakeEffect(shakes: 2))
}

import SwiftUI

struct ShakeEffect: GeometryEffect {
    var shakes: CGFloat = 0

    var animatableData: CGFloat {
        get { shakes }
        set { shakes = newValue }
    }

    func effectValue(size: CGSize) -> ProjectionTransform {
        let translation = 10 * sin(shakes * .pi * 2)
        return ProjectionTransform(CGAffineTransform(translationX: translation, y: 0))
    }
}
```

- Refine Code Organization

Reorganize your code into clearly defined modules and structures.

- **Components**: Contain reusable views like `PinView`, `PinCodeView`.
- **Styles**: Include styling structs and view modifiers.
- **Utilities**: Helper functions and extensions.
- **Tests**: Unit and UI tests.