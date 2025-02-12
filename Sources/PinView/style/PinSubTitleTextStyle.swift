import SwiftUI
import HybridColor
#if os(iOS)
import UIKit
#endif
/**
 * The tiny `sub-title-text` above `pin-code-input`
 * - Description: A view modifier that applies a subtle and smaller font style
 *                to sub-title text, typically used above pin code input
 *                fields to provide additional context or instructions.
 * - Note: Used in `bio-auth` and `pin-code-view`
 * - Note: Alt name: PinSubTitleTextModifier
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
    * Applies the PinSubTitleTextStyle to the view.
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
   PreviewContainer {
      Text("Apple is the leading tech company")
         .pinSubTitleText
         .padding()
         .frame(maxWidth: .infinity)
         .background(Color.blackOrWhite)
         #if os(macOS)
         .padding(.horizontal)
         #endif
   }
}
