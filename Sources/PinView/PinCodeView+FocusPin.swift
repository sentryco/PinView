import SwiftUI
/**
 * FocusPin - used to capture focus.
 */
extension PinCodeView {
   /**
    * I think the general idea here is to make int hashable
    * - Description: The `FocusPin` enum is a custom type that conforms to the
    *                `Hashable` protocol, allowing it to be used as an identifier
    *                for SwiftUI's focus system. It provides a way to
    *                programmatically control the focus of pin input fields in the
    *                `PinCodeView`.
    * - Note: we could make use of this "hashable" other places as well, like making List animate better etc, as list needs ID for anim to work great etc, and using int as id is simpler than adding id to the model
    * - Fixme: ⚠️️ Move to own file? or?
    * - Fixme: ⚠️️ Could we just use int? or does @FocusState need to be hashable? if it does, doc it
    */
   public enum FocusPin: Hashable {
      /**
       * Represents a focus on a specific field identified by it's index.
       * - Description: Identifies a particular pin input field within the
       *                `PinCodeView` by its index, allowing focus management on
       *                that specific field.
       * - Parameter i: The index of the field to focus.
       */
      case fieldId(_ i: Int)
      /**
       * Getter for int
       * - Description: Retrieves the index of the focused pin field within the `PinCodeView`.
       * - Fixme: ⚠️️ There might be other ways of doing this
       */
      var fieldId: Int {
         switch self {
         case .fieldId(let id): return id // Returns the identifier of the field that should be focused.
         }
      }
   }
}
