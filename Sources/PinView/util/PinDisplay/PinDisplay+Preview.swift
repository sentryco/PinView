import SwiftUI
/**
 * Preview (Dark / Light mode)
 */
#Preview(traits: .fixedLayout(width: 400, height: 300)) {
   PreviewContainer {
      PinDisplay(str: "8412") // Preview of PinDisplay with a sample pin code
         .padding(16) // Applies padding to the PinDisplay view
         .frame(maxWidth: .infinity) // Sets the maximum width of the frame to infinity
         .background(Color.blackOrWhite) // Sets the background color of the frame to either black or white based on the color scheme
         #if os(macOS) // Conditional compilation for macOS
         .padding(.horizontal) // Applies horizontal padding for macOS
         #endif
   }
}
