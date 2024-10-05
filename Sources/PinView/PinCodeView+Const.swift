import SwiftUI
/**
 * Const - titles
 */
extension PinCodeView {
   /**
    * - Description: Titles is a structure that holds the main title, subtitle, and button title for the PinCodeView. It provides a way to customize the text displayed in the PinCodeView.
    * - Fixme: ⚠️️ add modularity by making some optional?
    * - Fixme: ⚠️️ move into own file? own scope? like PinCodeTitle?
    */
   public struct Titles {
      /**
       * The main title of the PinCodeView
       * - Description: This is the main title that will be displayed at the top of the PinCodeView. It is used to provide a brief overview or instruction to the user.
       */
      public let title: String
      /**
       * The subtitle of the PinCodeView
       * - Description: This is the subtitle that will be displayed below the main title in the PinCodeView. It is used to provide additional information or instructions to the user.
       */
      public let subTitle: String
      /**
       * The title of the verification button
       * - Description: This is the title that will be displayed on the verification button in the PinCodeView. It is used to label the button that triggers the verification process.
       */
      public let buttonTitle: String
      /**
       * Initializes a Titles instance with the specified parameters
       * - Description: This initializer creates a new instance of Titles with the provided title, subtitle, and button title. These values are used to customize the text displayed in the PinCodeView.
       * - Parameters:
       *   - title: The main title of the PinCodeView.
       *   - subTitle: The subtitle of the PinCodeView.
       *   - buttonTitle: The title of the verification button.
       */
      public init(title: String, subTitle: String, buttonTitle: String) {
         self.title = title
         self.subTitle = subTitle
         self.buttonTitle = buttonTitle
      }
   }
   /**
    * Titles for the component (for debugging / preview etc)
    * - Description: The `defaultTitles` provides a set of default text values for the main title, subtitle, and button title of the PinCodeView. These defaults are used primarily for debugging and previewing the component within the development environment.
    * fix: move consts to constlib
    */
   public static let defaultTitles: Titles = {
      .init(
         title: "Verify confirmation code", // The main title of the PinCodeView.
         subTitle: "Enter the 4 digit code from the other device", // The subtitle of the PinCodeView.
         buttonTitle: "Verify" // The title of the verification button.
      )
   }()
}
/**
 * Callback related
 */
extension PinCodeView {
   /**
    * Callback signature for verifying the pin code.
    * - Description: A closure that is called when the verification button is pressed, allowing the pin code to be verified.
    * - Parameters:
    *   - pinCode: The pin code to be verified.
    */
   public typealias OnVerify = (_ pinCode: String) -> Void
   /**
    * Default callback on verify
    * - Description: A default implementation of the `OnVerify` closure that simply prints the pin code for debugging purposes. This implementation is intended for use in previews or during development and should be replaced with a proper verification mechanism in production code.
    */
   public static let defaultOnVerify: OnVerify = { (_ pinCode: String) in
      let pinCode: String = Array(arrayLiteral: pinCode).joined(separator: "-")
      Swift.print("verify - pinCode: \(pinCode)")
   }
}
