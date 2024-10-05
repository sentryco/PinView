import SwiftUI
/**
 * Used for non input pin code display
 * - Description: This view is used to display a non-input pin code. It takes a string as an input and displays it as a pin code.
 * - Note: Alternative name: `PinDisplayView`
 * - Fixme: ⚠️️ Animate the random sequence, similar to how the Documents app does it? later not imp right now.
 */
public struct PinDisplay: View {
   /**
    * - Description: The string to display
    */
   public let str: String
   /**
    * - Parameter str: Array of chars
    */
   public init(str: String) {
      self.str = str
   }
}
