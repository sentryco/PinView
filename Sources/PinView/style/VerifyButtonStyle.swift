import SwiftUI
/**
 * Used in master-pass-view and pin-code-view
 * - Abstract: This struct defines the style for a verify button, including its background color, text color, and padding.
 * - Description: A button style that provides visual feedback for verification actions, with a customizable background color, text color, and padding. It is designed to be used in contexts where a confirmation action is required, such as in master-pass-view and pin-code-view.
 * - Note: Ref this answer: https://stackoverflow.com/a/62678839/5389500
 * - Note: This var can also be moved to the modifier scope: https://stackoverflow.com/a/66381914/5389500
 * - Note: Also works in the style scope: https://stackoverflow.com/a/69134893/5389500
 * - Note: Alternative name: DisablableButton
 * - Fixme: ⚠️️ Add pressed state: see https://swiftuirecipes.com/blog/custom-swiftui-button-with-disabled-and-pressed-state
 * - Fixme: ⚠️️ Add a subtle storke to the button? later when we tweak design etc
 */
internal struct VerifyButtonStyle: ButtonStyle {
   /**
    * The background color of the button.
    */
   internal let color: Color
   /**
    * The color of the button text.
    */
   internal let textColor: Color
   /**
    * The horizontal padding to apply to the button.
    */
   internal let padding: CGFloat
}
/**
 * Content
 */
extension VerifyButtonStyle {
   /**
    * body
    * - Parameters:
    *   - configuration: The configuration for the button.
    */
   internal func makeBody(configuration: Configuration) -> some View {
      configuration.label // Gets the label of the button
         .font(.system(.title3, design: .rounded)) // Sets the font style of the button text
         .fontWeight(.semibold) // Sets the font weight of the button text to semibold
         .foregroundColor(textColor) // Sets the color of the button text
         .frame(maxWidth: .infinity) // Sets the maximum width of the button to be as wide as allowed
         .padding(15) // Applies padding to the button
         .background(
            Capsule()
               .fill(color) // Fills the capsule shape with the specified color
         )
         .padding(padding) // Applies additional padding to the button based on the style's padding property
   }
}
/**
 * Convenience
 */
extension Button {
   /**
    * Defines the background color of the button based on the color scheme
    */
   fileprivate var backgroundColor: Color {
      let light: Color = .gray
      let dark: Color = .gray
      return .init(light: light, dark: dark)
   }
   /**
    * Defines the text color of the button based on the color scheme
    */
   fileprivate var textColor: Color {
      let light: Color = .black
      let dark: Color = .white
      return .init(light: light, dark: dark)
   }
   /**
    * - Description: Styles the button as a verify button with the specified enabled state.
    * - Fixme: ⚠️️ add custom padding im params?
    * - Fixme: ⚠️️ add default bool ? true?
    * - Parameter isEnabled: Indicates whether the button is enabled or not.
    *  - Returns: A view styled as a verify button with the specified enabled state.
    */
   @warn_unqualified_access // Ref: https://www.hackingwithswift.com/quick-start/swiftui/how-to-make-swiftui-modifiers-safer-to-use-with-warn-unqualified-access
   internal func verifyButtonStyle(isEnabled: Bool) -> some View {
      self.verifyButtonStyle(
         color: backgroundColor.opacity(isEnabled ? 0.3 : 0.2), // Adjusts the background color based on the enabled state
         textColor: textColor.opacity(isEnabled ? 0.8 : 0.4), // Adjusts the text color based on the enabled state
         padding: 15
      )
   }
   /**
    * - Description: Styles the button as a verify button with the specified background and text colors.
    * - Parameters:
    *   - color: The background color of the button.
    *   - textColor: The color of the button text.
    *   - padding: The horizontal padding to apply to the button.
    * - Returns: A view styled as a verify button with the specified background and text colors.
    */
   internal func verifyButtonStyle(color: Color, textColor: Color, padding: CGFloat = 15) -> some View {
      let style = VerifyButtonStyle(
         color: color, // Sets the background color of the button
         textColor: textColor, // Sets the color of the button text
         padding: padding // Sets the horizontal padding to apply to the button
      )
      return self.buttonStyle(style)
   }
}
/**
 * Preview (shows enabled and disabled state)
 * - Fixme: ⚠️️ add disable handler etc?
 */
#Preview(traits: .fixedLayout(width: 400, height: 300)) {
   // the closure is a mechanism to show the two states
   let closure: (_ isEnabled: Bool) -> some View = { isEnabled in
      Button("Confirm") {
         Swift.print("ok works!")
      }// Big and blue etc, maybe we made code for that earlier?
         .verifyButtonStyle(isEnabled: isEnabled)
         .frame(width: .infinity, height: 64)
         // .padding(.vertical, 0)
         .background(Color.blackOrWhite)
         #if os(macOS)
         .padding(.horizontal)
         #endif
   }
   return ZStack {
      Rectangle() // A rectangle to fill the background
         .fill(Color.secondaryBackground) // Fills the rectangle with a secondary background color
         .ignoresSafeArea(.all) // Ignores the safe area on all sides
      VStack(spacing: .zero) { // A vertical stack with no spacing
         closure(true)
            .environment(\.colorScheme, .light) // Sets the environment to light mode
         closure(false)
            .environment(\.colorScheme, .dark) // Sets the environment to dark mode
      }
   }
   .environment(\.colorScheme, .dark)
}
