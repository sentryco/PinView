import SwiftUI
/**
 * Content
 */
extension PinStyle {
   /**
    * - Abstract: Styles the content of the PinCodeView by applying a centered
    *             alignment, a frame with a specified width and height, and a
    *             background with a corner radius and a stroke that changes color
    *             based on focus state.
    * - Description: This function styles the content of the PinCodeView. It
    *                aligns the text to the center, sets a frame with a specific
    *                width and height, and applies a background with a corner
    *                radius. The stroke color of the background changes based on
    *                whether the pin is in focus or not.
    * - Fixme: ⚠️️ Use consts for width height values etc
    * - Parameters:
    *   - content: The content to be styled.
    * - Returns: The styled content view.
    */
   func body(content: Content) -> some View {
      content
         .multilineTextAlignment(.center) // Sets the alignment of the text within the view to center
         .frame(width: 45, height: 45) // - Fixme: ⚠️️ Move these into consts? or use dynamic sizing? set via modifier params?
         .background(Color.secondary.opacity(0.2).cornerRadius(5))
         .background(
            // Creates a rounded rectangle with a corner radius of 5 for the background shape
            RoundedRectangle(cornerRadius: 5)
            // We show blue stroke when the focus is in the textfield
            // Otherwise we show white stroke
               .stroke(
                  isFocused ? Color.primary.opacity(0.6) : Color.primary.opacity(0.3), // Sets the stroke color based on focus state
                  lineWidth: 2 // Sets the width of the stroke
               )
         )
   }
}
/**
 * Convenient
 */
extension View {
   /**
    * Applies the PinStyle modifier to a view, styling it based on focus state.
    * - Description: This function applies the PinStyle modifier to a view,
    *                which styles the view based on its focus state. It is
    *                particularly useful for text fields in a pin code entry
    *                interface, where the appearance of each pin changes based
    *                on whether it is in focus or not.
    * - Parameter isFocused: A binding to a boolean indicating if the view is
    *                        focused.
    * - Returns: The view with the PinStyle modifier applied.
    */
   func pinStyle(isFocused: Binding<Bool>) -> some View {
      let modifier = PinStyle(isFocused: isFocused)
      return self.modifier(modifier)
   }
}
