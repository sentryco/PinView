import SwiftUI
/**
 * Content
 */
extension PinDisplay {
   /**
    * body
    * - Description: This view represents the body of the PinDisplay. It
    *                creates a horizontal stack of Text views, each displaying
    *                a character from the input string. Each Text view is styled
    *                with a pin style.
    * - Fixme: ⚠️️ Why do we provide a default value .const?
    * - Fixme: ⚠️️ Use spacing const from constlib?
    */
   public var body: some View {
      HStack(alignment: .center, spacing: 15) { // Creates a horizontal stack with center alignment and 15 spacing
         ForEach(str.map { $0 }, id: \.self) { char in // Directly iterate over each character in the string
            Text(String(char)) // Converts the character to a string and displays it as text
               .pinStyle(isFocused: .constant(false)) // Style textfield with pin style
         }
      }
   }
}
