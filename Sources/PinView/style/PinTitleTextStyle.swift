import SwiftUI
/**
 * The text style used in the pin-code title input
 * - Description: A view modifier that applies a title2 font size and semibold
 *                weight to text, typically used for titles in pin code input
 *                screens.
 * - Note: Alt name: `PinTitleTextModifier`
 * - Note: Used in `lockscreen`, `master-psw`, `bio-auth` and `pin-view`
 */
public struct PinTitleTextStyle: ViewModifier {
   /**
    * Body
    * - Parameter content: The content to be modified with the PinTitleTextStyle.
    */
   public func body(content: Content) -> some View {
      content
         .font(.title2) // Sets the font style to title2
         .fontWeight(.semibold) // Sets the font weight to semibold
   }
}
/**
 * Convenient
 */
extension Text {
   /**
    * Style
    */
   public var pinTitleText: some View {
      let modifier = PinTitleTextStyle()
      return self.modifier(modifier)
   }
}
/**
 * Preview
 */
#Preview(traits: .fixedLayout(width: 200, height: 200)) {
   PreviewContainer {
      Text("1")
         .pinTitleText
         .padding()
         .background(Color.gray.opacity(0.2))
         .frame(maxWidth: .infinity)
         .background(Color.blackOrWhite)
         #if os(macOS)
         .padding(.horizontal)
         #endif
   }
}
