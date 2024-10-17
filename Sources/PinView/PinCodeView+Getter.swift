import SwiftUI

extension PinCodeView {
   /**
    * Assert if verify button is enabled / disabled (reactive)
    * - Description: Determines whether the verify button should be enabled
    *                based on the completeness of the pin code. The button is
    *                enabled only when all pin fields have been filled.
    * - Note: Alterntive name: `isVerifyButtonenabled`
    */
   var isEnabled: Bool {
      !pin.contains { $0.isEmpty } // Checks if any of the pin fields are empty
   }
}
