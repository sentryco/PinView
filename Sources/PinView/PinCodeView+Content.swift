import SwiftUI
#if os(iOS)
import UIKit
#endif
/**
 * Content
 */
extension PinCodeView {
   /**
    * The body of the PinCodeView, containing the layout and content of the view.
    * - Description: The main view structure of the `PinCodeView`, which organizes
    *                the header, subtitle, pin input fields, and verify button into
    *                a vertical stack.
    * - Fixme: ⚠️️ Add the length? length of? elaborate
    * fixme: use task: .task { await MainActor.run {  pinFocusState = .fieldId(0) } }
    */
   public var body: some View {
      VStack {
         headerText // Displays the header text of the PinCodeView
         subTitleText // Displays the subtitle text of the PinCodeView
         pinViews // Pin text-fields // Displays the text fields for entering the pin code
         verifyButton // Displays the verify button
      } // End of vstack
      .onAppear { // Set init focus (this might not work, seems not to work in preview, maybe in app)
         DispatchQueue.main.asyncAfter(deadline: .now() + 0.75) { // Seems like this is the official way (adding a dispatcher): https://www.kodeco.com/31569019-focus-management-in-swiftui-getting-started
            pinFocusState = .fieldId(0) // Set the initial focus state to the first pin field
         }
      }
   }
}
/**
 * Components
 */
extension PinCodeView {
   /**
    * Header
    * - Description: The header text component of the `PinCodeView`, 
    *                displaying the main title provided by the `titles` 
    *                structure.
    */
   fileprivate var headerText: some View {
      Text(self.titles.title) // Displays the title of the PinCodeView
         .pinTitleText // Applies the style for the title text
   }
   /**
    * Sub-title
    * - Description: The subtitle text component of the `PinCodeView`,
    *                providing additional context or instructions to the user
    *                beneath the main title.
    * - Fixme: ⚠️️ Move padding to const?
    */
   fileprivate var subTitleText: some View {
      Text(self.titles.subTitle) // Displays the subtitle of the PinCodeView
         .pinSubTitleText // Applies the style for the subtitle text
         .padding(.top, 4) // Or else the lement feels to near?
   }
   /**
    * Verify button
    * - Description: This view represents the verification button in the
    *                PinCodeView. It is responsible for triggering the
    *                verification process when clicked.
    * - Fixme: ⚠️️ Add vibration to verify button, one melody for success and one for fail etc, could / should this be done in caller or no?
    * - Fixme: ⚠️️ Add a subtle-stroke to the btn? or maybe make a style for the entire compoent? later maybe?
    * - Fixme: ⚠️️ Make the not disabled style have more color etc?
    * - Fixme: ⚠️️ Add subtle-stroke to verify-button? at all time, or when complete?
    * - Fixme: ⚠️️ move width to const
    */
   fileprivate var verifyButton: some View {
      let isPhoneDevice: Bool = {
         #if os(iOS)
         return UIDevice.current.userInterfaceIdiom == .phone
         #else
         return false
         #endif
      }()
      return Button(titles.buttonTitle) {
         onVerify?(pin.joined())  // Calls the onVerify callback with the joined pin code
      }
      .verifyButtonStyle(isEnabled: isEnabled) // Applies the verify button style based on the isEnabled state
      .frame(width: isPhoneDevice ? nil : 360) // Customize for non-iphone devices etc
      .disabled(!isEnabled) // If this stops working, make the verify again etc
      // - Fixme: ⚠️️ move the bellow to a const
      .accessibilityIdentifier("pinCodeVerifyButton")
   }
   /**
    * Pins
    * - Description: This view represents the pin code fields in the
    *                PinCodeView. It is responsible for displaying and managing
    *                the pin code input.
    * - Note: We could refactor this further but readabilty becomes worse if we do
    * - Fixme: ⚠️️ Move into: EditablePinDisplay? or?
    * - Fixme: ⚠️️ Use 16px as spacing? and use const 👈
    * - Fixme: ⚠️️ move "pinViewContainer" const to constLib 👈
    */
   fileprivate var pinViews: some View {
      HStack(spacing: 15) { // Pin code row
         // Iterate over the data collection with indices
         ForEach(0..<self.count, id: \.self) { index in
            let focusPin: FocusPin = .fieldId(index) // Set the current focus pin
            let nextPin: FocusPin? = index + 1 < self.count ? .fieldId(index + 1) : nil // Set the next focus pin
            PinView( // Returns a PinView
               pin: focusPin, // Sets the pin of the PinView to the current focus pin
               nextPin: nextPin, // Sets the next pin of the PinView to the next focus pin
               pinValues: $pin, // Binds the pin values of the PinView to the pin state
               pinFocusState: $pinFocusState // Binds the pin focus state of the PinView to the pin focus state
            )
         }
      }
      .padding(.vertical) // Add vertical space with default padding
      .accessibilityElement(children: .contain) // Enable accessID on container
      // - Fixme: ⚠️️ move the bellow to a const
      .accessibilityIdentifier("pinViewContainer") // Set the accessibility identifier of the view
   }
}
