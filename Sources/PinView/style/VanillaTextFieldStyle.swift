import SwiftUI
/**
 * Disables uneccesary / annoying textfield features
 * - Description: This style removes default text field behaviors such as autocorrection, autocapitalization, and keyboard suggestions to provide a cleaner and more controlled text input experience.
 * - Note: Alternate name: `CleanTextField`
 */
internal struct VanillaTextFieldStyle: TextFieldStyle {
   /**
    * - Description: Applies the vanilla text field style to the text field.
    * - Note: there is also: `.scrollDismissesKeyboard(.immediately)`
    * - Note: We set this to .keyboardType(.asciiCapable), to avoid some keyboard shenaneganze, but this will not support russian characters tho
    * - Fixme: ⚠️️ this might not actually work, if we also add another textfiledstyle, do some testing
    * - Parameter configuration: The configuration to apply to the text field.
    * - Returns: A modified version of the text field with the vanilla text field style applied.
    */
   internal func _body(configuration: TextField<Self._Label>) -> some View {
      configuration
         #if os(iOS)
         .keyboardType(.asciiCapable)  // Sets the keyboard type to ASCII capable, suitable for most common text input
         .autocapitalization(.none) // Add the modifiers to disable autofill prompt
         #endif
         .autocorrectionDisabled(true) // Just .disableAutocorrection(true) leaves the remnants of the suggestion bar, but adding the .keyboardType(.alphabet) makes it all go away.
   }
}
/**
 * convenient
 */
extension View {
   /**
    * Style
    */
   internal var vanillaTextFieldStyle: some View {
      let tfStyle = VanillaTextFieldStyle()
      return self.textFieldStyle(tfStyle)
   }
}
/**
 * Preview
 * - Note: preview not really needed it's just a keyboard cleaner etc, but its fine
 */
#Preview(traits: .fixedLayout(width: 200, height: 100))  {
   let view = TextField("Placeholder-text-field", text: .constant(""))
      .vanillaTextFieldStyle
      #if os(macOS)
      .textFieldStyle(.plain)
      #endif
   // .previewLayout(.sizeThatFits)
      .padding()
      .background(Color.blackOrWhite)
      #if os(macOS)
      .padding(.horizontal)
      #endif
   return ZStack {
      Rectangle() // A rectangle to fill the background
         .fill(Color.secondaryBackground) // Fills the rectangle with a secondary background color
         .ignoresSafeArea(.all) // Ignores the safe area on all sides
      VStack(spacing: .zero) { // A vertical stack with no spacing
         view // The content view
            .environment(\.colorScheme, .light) // Sets the environment to light mode
         view // The content view again
            .environment(\.colorScheme, .dark) // Sets the environment to dark mode
      }
   }
   .environment(\.colorScheme, .dark)
//      .frame(width: 200, height: 100)
}
