import SwiftUI
/**
 * Preview (dark / light mode)
 * - Description: This preview demonstrates the appearance and functionality
 *                of a single PinView instance in both dark and light modes. It
 *                initializes a PinView with the first field ID, no next pin,
 *                and binds the pin values and focus state to state variables.
 *                The view is padded, made to fill the available space, and its
 *                background color changes based on the current color scheme.
 * - Fixme: ⚠️️ prefill with random code?
 */
#Preview(traits: .fixedLayout(width: 300, height: 300)) { // (traits: .fixedLayout(width: 300, height: 300))
   struct DebugView: View { // We need debug view for pin focus state to work etc
      @State var pinValues: [String] = [""]
      @FocusState var pinFocusState: PinCodeView.FocusPin? // PinCodeView.FocusPin.pinOne
      var body: some View {
         PinView( // Initializes a PinView instance
            pin: .fieldId(0), // Sets the pin to the first field ID
            nextPin: nil, // No next pin is specified
            pinValues: $pinValues, // Binds the pin values to the state variable
            pinFocusState: $pinFocusState // Binds the pin focus state to the state variable
         )
            .padding() // Adds padding around the view
            .frame(maxWidth: .infinity) // Sets the maximum width of the frame to infinity, making it fill the available space
            .background(Color.blackOrWhite) // Sets the background color to either black or white based on the current color scheme
      }
   }
   return PreviewContainer { // Adds dark and light mode etc
      DebugView() // The content view
   }
}
