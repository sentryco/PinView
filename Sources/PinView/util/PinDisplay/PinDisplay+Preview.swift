import SwiftUI
/**
 * Preview (Dark / Light mode)
 */
#Preview(traits: .fixedLayout(width: 400, height: 300)) {
   let view = PinDisplay(str: "8412") // Preview of PinDisplay with a sample pin code
      .padding(16) // Applies padding to the PinDisplay view
      .frame(maxWidth: .infinity) // Sets the maximum width of the frame to infinity
      .background(Color.blackOrWhite) // Sets the background color of the frame to either black or white based on the color scheme
      #if os(macOS) // Conditional compilation for macOS
      .padding(.horizontal) // Applies horizontal padding for macOS
      #endif
   return ZStack { // Adds dark and light mode etc
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
}
