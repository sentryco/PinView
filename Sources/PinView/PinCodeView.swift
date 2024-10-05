import SwiftUI
/**
 * Editable pincode view (used for login)
 * - Abstract: has `title`, `description`, `Mutiple digits`, `verify-btn`
 * - Description: The `PinCodeView` is a user interface component that allows users to input a secure pin code. Each digit of the pin code is entered into its own field, enhancing security by obscuring the input and providing a clear visual cue for the number of digits required. The view supports backspace functionality, enabling users to correct errors by deleting the most recent entry and automatically shifting focus to the previous field. Additionally, the view includes an obfuscation feature that hides the entered numbers, preventing onlookers from discerning the pin code.
 * - Important: ⚠️️ Focus state doesn't work in preview, it works in a real app or simulator
 * - Premiss 1: "Each field will not accept more than one value"
 * - Premiss 2: "On value, the input should change focus to the next one"
 * - Note: Has support for 4 - 6  digit input etc (dynamic number)
 * - Note: Now in this file, we combined what we have been building with a couple of new things. These new things include FocusState FocusState is helping us keep an eye on the inputField the user is currently typing on and notifies us when the input is up to the textlimit
 * - Note: We have specified in our case when the input receives a value that is equal to one, it will notify our FocusState and then the focus will be changed to the next input till we get to the last inputField
 * - Note: Suggestions on how to fix set focus on init: https://stackoverflow.com/questions/68073919/swiftui-focusstate-how-to-give-it-initial-value
 * - Fixme: ⚠️️⚠️️ Add backlash functionality (requires some exploration) 👉 Make it so that when we tap back-button we delete current then focus moves to prev pin-view, or is this in now?
 * - Fixme: ⚠️️⚠️️ Make it so that we can hide numbers we type so others can't see them, obfuscation feature
 * - Fixme: ⚠️️ Move to own package. possibly opensource
 */
public struct PinCodeView: View {
   /**
    * Pin code range. 4 or 6 etc
    * - Description: This variable represents the total number of digits in the pin code. It is used to dynamically configure the number of input fields in the PinCodeView.
    * - Fixme: ⚠️️ Remove this, base it on pin string length? 👈 or just make it a getter for text length etc
    */
   let count: Int
   /**
    * We use this to keep track of which pin has focus
    * - Description: This variable is used to track the current focus state of the pin input fields. It is updated whenever the focus changes, allowing the application to respond to user input and control the focus programmatically.
    */
   @FocusState var pinFocusState: FocusPin?
   /**
    * Stores the pin code values in an array to accommodate a dynamic number of pins.
    * - Description: An array of strings representing each digit of the pin code entered by the user. It allows for dynamic configuration of the pin code length and facilitates individual digit manipulation for operations such as focus change and deletion.
    * - Note: We need to store values in an array so we can set our own number of pins needed
    * - Note: This is an array use index from pin enum
    * - Note: Alternative names: `pinCodeArray`, `pinCode`, `pins`
    * - Fixme: ⚠️️ Make this binding so we could track change from caller, is that needed? and pre-populate etc? (btw We can prepop state)
    * - Fixme: ⚠️️ This should be a string not an array? 👈 or an Character array?
    */
   @State var pin: [String]
   /**
    * Holds the title and description for the PinCodeView component.
    * - Description: A structure holding the title and description for the PinCodeView, which provides context and instructions to the user.
    */
   let titles: Titles // defaultTitles
   /**
    * Triggered when the verify button is pressed, passing the current pin code.
    * - Description: The callback function that is invoked when the verify button is pressed. It provides the entered pin code as a parameter for further validation or processing.
    * - Fixme: ⚠️️ Don't pass pin in callback, just use pin binding? it's fine for now, versatile
    */
   let onVerify: OnVerify?
   /**
    * Initializes a `PinCodeView` with the specified parameters.
    * - Description: Initializes a `PinCodeView` with a specific number of digits, optional initial focus state, titles for context, and a verification callback.
    * - Parameters:
    *   - count: The number of digits in the pin code.
    *   - pinFocusState: The initial focus state of the pin fields.
    *   - titles: The titles and descriptions for the PinCodeView.
    *   - onVerify: The callback to execute when the verify button is pressed.
    */
   public init(count: Int, pinFocusState: FocusPin? = nil, titles: Titles = defaultTitles, onVerify: @escaping OnVerify = defaultOnVerify) {
      // init related
      self.count = count
      self.titles = titles
      self.onVerify = onVerify
      // State related
      self.pin = Array(repeating: "", count: count) // Initialize the pin array with empty strings, one for each digit in the pin code
      self.pinFocusState = pinFocusState
   }
}
