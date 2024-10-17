import SwiftUI
/**
 * Preview - Shows single pin (Dark / Light - mode)
 * - Description: This preview section provides a visual representation of a
 *                single pin input field in both dark and light modes,
 *                allowing for design and functionality verification.
 * - Fixme: ⚠️️ add a random pin value?
 */
#Preview(traits: .fixedLayout(width: 300, height: 300)) { // (traits: .fixedLayout(width: 300, height: 300))
   struct DebugContainer: View {
      @State var isFocused = false
      var body: some View {
         TextField("", text: .constant(""))
            .pinStyle(isFocused: $isFocused) // Applies the pin style based on the focus state
            .padding() // Adds padding around the view
            .frame(maxWidth: .infinity) // Sets the maximum width of the frame to infinity
            .textFieldStyle(.plain) // removes the native text border for macos
      }
   }
   let view = DebugContainer()
      .background(Color.blackOrWhite)
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
}
