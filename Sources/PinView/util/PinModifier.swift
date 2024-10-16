import SwiftUI
/**
 * - Note: Using @Environment(\.isFocused) var isFocused does not work - Fixme: ⚠️️ add reasoning?
 */
struct PinModifier: ViewModifier {
   /**
    * A binding to the pin code string.
    * - Description: This binding represents the pin code string that is being modified. It is a two-way binding, meaning that changes to the pin code string in the text field will update this binding, and changes to this binding will update the text field.
    */
   @Binding var pin: String
   /**
    * - Description: This variable sets the maximum number of characters allowed in the pin input field. It is currently set to 1, meaning each pin input field can only hold one character.
    * - Note: With this code the binding variable pin will be holding the value from our input field,
    *         and the variable textlimit will be a placeholder for how many characters or the length of the value we want our input to receive,
    *         in my case I want each input to hold just one value, so my textlimit variable is one.
    * - Note: The function limitText takes an argument of type Integer upper and checks if the value on the input is greater than the upper argument.
    * - Note: If true, it will assign pin a new value that returns just the first character in the initial value provided.
    * - Fixme: ⚠️️ make this static?
    */
   var textLimt: Int = 1 // Limit input to 1 char
}
/**
 * Content
 */
extension PinModifier {
   /**
    * This function is the entry point for the PinModifier view modifier. It takes a content view and applies the necessary modifications to it.
    * - Parameter content: The content view to be modified.
    * - Returns: The modified view.
    */
   func body(content: Content) -> some View {
      content
         #if os(iOS)
         .keyboardType(.numberPad) // Should prompt the keyboard to show digits only?
         #endif
         .onChange(of: pin) { _, _ in // Listens for changes to the pin binding and executes the closure when a change is detected
            limitText(textLimt) // Calls the limitText function to ensure the pin does not exceed the specified limit
            restrictToNumber() // Calls the restrictToNumber function to ensure only numbers are allowed in the pin
         }
   }
}
/**
 * Ext - modifier
 */
extension PinModifier {
   /**
    * Only allow 1 char in each text field
    * - Description: This function limits the length of the input text to the specified upper limit. If the input text exceeds the upper limit, it trims the text to match the upper limit.
    * - Parameter upper: The max allowed number of characters
    */
   func limitText(_ upper: Int) {
      if pin.count > upper {
         self.pin = String(pin.prefix(upper)) // Reduces string to 1 char
      }
   }
   /**
    * Only allow numbers as input
    * - Description: This function ensures that only numeric input is allowed in the pin. If the first character of the input is not a number, the pin is cleared.
    * - Note: Can also do: self.allSatisfy { character in character.isNumber }
    */
   func restrictToNumber() {
      self.pin = pin.first?.isNumber == true ? self.pin : "" // If the first character is a number, keep it, otherwise clear the pin
   }
}
/**
 * Modifier
 */
extension View {
   /**
    * Applies a PinModifier to the view.
    * - Description: This function applies a PinModifier to the view. It takes a binding to a string, which represents the pin, and returns the view with the PinModifier applied. The PinModifier ensures that the pin only contains numeric characters and does not exceed a specified length.
    * - Parameter pin: A binding to the string value that represents the pin. This value is modified by the PinModifier to enforce numeric input and length constraints.
    * ## Examples:
    * view.pinModifier(pin: .constant("1234"))
    */
   func pinModifier(pin: Binding<String>) -> some View {
      let modifier = PinModifier(pin: pin)
      return self.modifier(modifier) // Applies the PinModifier to the view
   }
}
