import SwiftUI
/**
 * The text style used in the pin-code title input
 * - Description: A view modifier that applies a title2 font size and semibold weight to text, typically used for titles in pin code input screens.
 * - Note: Alt name: `PinTitleTextModifier`
 * - Note: Used in `lockscreen`, `master-psw`, `bio-auth` and `pin-view`
 */
public struct PinTitleTextStyle: ViewModifier {
   /**
    * Body
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
   let view = Text("1")
      .pinTitleText
      .padding()
      .background(Color.gray.opacity(0.2))
      .frame(maxWidth: .infinity)
      .background(Color.blackOrWhite.opacity(1))
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
}
