import SwiftUI
/**
 * Content
 */
extension PinView {
   /**
    * - Note If we set the "" it becomes the placeholder text it seems, we could override
    * - Description: This view represents the body of the PinView. It contains
    *                a TextField that takes in the pin values. The TextField is
    *                styled and modified based on the pin's focus state and
    *                editing state. When a value changes, the focus shifts to
    *                the next TextField.
    * - Fixme: ⚠️️ Change focus to the previous `InputField` If the user deletes the input value
    * - Fixme: ⚠️️ Not sure why we need the "" in TextField? access id?
    * - Fixme: ⚠️️ Move the onchange to own func?
    * - Fixme: ⚠️️ Consolidate modifiers into one super modifier?
    */
   var body: some View {
      TextField("", text: $pinValues[pin.fieldId]) { (_ isEditing: Bool) in
         self.editing = isEditing // Set the editing state of the PinView based on user interaction
      }
         #if os(macOS)
         .textFieldStyle(.plain) // ⚠️️ Removes the default macOS styling from a TextField, this will remove all styling, including padding and background color. You may need to add additional modifiers to achieve the desired look.
         #endif
         .vanillaTextFieldStyle // Resets textField bloat
         .pinModifier(pin: $pinValues[pin.fieldId]) // Modifies the pin based on the pin field id
         .pinStyle(isFocused: $editing) // Styles the pin based on the editing state
         // When a value changes we shift the focus to the next textfield
         .onChange(of: pinValues[pin.fieldId]) { (_/*oldVal*/, _ newVal: String) in
            if newVal.count == 1 && newVal.first?.isNumber == true { // Check if the new value count is 1 and the first character is a number
               self.pinFocusState = self.nextPin // Shifts the focus to the next pin
            }
         }
         .focused($pinFocusState, equals: pin) // Focuses the pin based on the pin focus state
         // - Fixme: ⚠️️ move to const
         .accessibilityIdentifier("pinView") // no stack involved, so accessid not needed
   }
}
