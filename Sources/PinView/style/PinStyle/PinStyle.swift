import SwiftUI
/**
 * Single pin
 * - Description: This view modifier is designed to style a single pin in a pin code entry interface. It dynamically adjusts its appearance based on the focus state of the pin.
 * - Abstract: This view modifier is used in the context of the PinCodeView to style a single pin in a pin code entry interface. It dynamically adjusts its appearance based on the focus state of the pin.
 * - Note: This modifier is intended to be used in conjunction with a text field or similar input view to create a visually appealing and interactive pin entry experience.
 * - Fixme: ⚠️️ There is also native textfield modifier / style, maybe try that?
 * - Todo:
 *   - Explore the use of native text field modifier/style for potential improvements.
 *   - Document the usage of this modifier in the context of the PinCodeView.
 */
struct PinStyle: ViewModifier {
   /**
    * We get this from parent onEditing call
    * - Description: This binding variable is used to track the focus state of the pin. It is updated by the parent view's onEditing call.
    */
   @Binding var isFocused: Bool
}
