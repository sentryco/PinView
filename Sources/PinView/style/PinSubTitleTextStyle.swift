import SwiftUI
import HybridColor
#if os(iOS)
import UIKit
#endif
/**
 * The tiny `sub-title-text` above `pin-code-input`
 * - Description: A view modifier that applies a subtle and smaller font style to sub-title text, typically used above pin code input fields to provide additional context or instructions.
 * - Note: Used in `bio-auth` and `pin-code-view`
 * - Note: alt name: PinSubTitleTextModifier
 */
public struct PinSubTitleTextStyle: ViewModifier {
   /**
    * body
    * - Description: Applies the PinSubTitleTextStyle to the view.
    * - Note: We make the font slightly larger for iPad, hard to see in videos etc
    * - Parameter content: The content to be modified with the PinSubTitleTextStyle.
    * - Returns: A view with the PinSubTitleTextStyle applied.
    */
   public func body(content: Content) -> some View {
      content
         #if os(iOS)
         .font(UIDevice.current.userInterfaceIdiom == .phone ? .caption2 : .caption) // very small text
         #endif
         .fontWeight(.thin) // Sets the font weight to thin
   }
}
/**
 * Convenient
 */
extension Text {
   /**
    * - Description: Applies the PinSubTitleTextStyle to the view.
    * - Returns: A view with the PinSubTitleTextStyle applied.
    */
   public var pinSubTitleText: some View {
      let modifier = PinSubTitleTextStyle()
      return self.modifier(modifier)
   }
}
/**
 * Preview
 * - Fixme: ⚠️️ Add custom frame for iPad
 */
#Preview(traits: .fixedLayout(width: 300, height: 300)) {
   let view = Text("Apple is the leading tech company")
      .pinSubTitleText
      .padding()
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
