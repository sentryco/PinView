import SwiftUI
import HybridColor
//import HapticFeedback
/**
 * Preview (Dark-mode)
 * - Description: Provides a preview of the `PinCodeView` in dark mode,
 *                showcasing the user interface for pin code input. The preview
 *                includes a `PinCodeView` configured with a 4-digit count and a
 *                sample verification callback that prints the entered pin and
 *                provides haptic feedback on iOS devices.
 * - Note: Don't add light and dark mode, it's important to see the entire design as a whole.
 * - Note: For now we can just toggle the environemtn var etc
 */
#Preview(traits: .fixedLayout(width: 400, height: 640)) {
   PreviewContainer {
      PinCodeView(count: 4) { pin in
         Swift.print("On verify - pin: \(pin)")
//         HapticFeedback.play(pin == "1234" ? .success : .deny)
      }
      .padding(.vertical)
      .background(
         Rectangle()
            .fill(Color.blackOrWhite)
//            .ignoresSafeArea(.all)
      )
   }
//   .environment(\.colorScheme, .dark) // USe this to test modes: .light / .dark
}
