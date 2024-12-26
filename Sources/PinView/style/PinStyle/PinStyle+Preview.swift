import SwiftUI
/**
 * Preview - Shows single pin (Dark / Light - mode)
 * - Description: This preview section provides a visual representation of a
 *                single pin input field in both dark and light modes,
 *                allowing for design and functionality verification.
 * - Fixme: ⚠️️ Add a random pin value? use copilot?
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
   return PreviewContainer {
      DebugContainer()
   }
}
