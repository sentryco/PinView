import SwiftUI
/**
 * Pin view (single digit)
 * - Description: This view represents a single digit input in a pin code entry
 *                interface. It manages its own focus state and automatically
 *                navigates to the next input when a digit is entered. It also
 *                communicates its value to the parent view for data aggregation.
 * - Note: More on focus state: https://swiftwithmajid.com/2021/08/24/mastering-focusstate-property-wrapper-in-swiftui/
 * - Note: We automatically switch to other pin view when a number is entered
 * - Note: Alternative names: `PinDigitView`, `single-pin-view`
 * - Fixme: ⚠️️ Seems like there is an annoying autofill prompt. Not sure how to remove it, double check if its in simulator and or real device as well etc?
 * - Fixme: ⚠️️ I think this view could be a ViewModifier?
 */
struct PinView: View {
   /**
    * The "focus-pin" for this view
    * - Abstract: indicating the position of this PinView within the PinCodeView.
    * - Description: This property is used to manage the focus state of the
    *                PinView, allowing for automatic navigation between PinViews
    *                when a digit is entered.
    */
   let pin: PinCodeView.FocusPin
   /**
    * - Abstract: This property holds the reference to the next PinView in the
    *             sequence. When a value is entered in this PinView, the focus
    *             automatically shifts to the next PinView if one exists. This
    *             facilitates a seamless user experience when entering a sequence
    *             of digits.
    * - Description: This property is a reference to the next PinView in the
    *                sequence. When a digit is entered in the current PinView,
    *                the focus automatically shifts to this next PinView, if it
    *                exists. This allows for a smooth and intuitive user
    *                experience when entering a sequence of digits in the
    *                PinCodeView.
    * - Note: This property is used in conjunction with the `pinFocusState` to
    *         manage the focus state of the PinViews within the PinCodeView.
    */
   let nextPin: PinCodeView.FocusPin?
   /**
    * - Abstract: An array of strings representing the values of the pins. This
    *             property is bound to the parent view to facilitate the
    *             exchange of data between PinViews.
    * - Description: This binding array holds the values of each pin in the
    *                PinCodeView. Each string in the array corresponds to a
    *                single pin's value. It allows for the tracking and
    *                updating of pin values as they are entered by the user.
    * - Note: This property is used to store and manage the values entered into
    *         the PinViews within the PinCodeView.
    * - Fixme: ⚠️️ Could we also use Character?, and maybe not make it an array?
    *          or is this more like ref to the caller etc?
    */
   @Binding var pinValues: [String]
   /**
    * - Abstract: Reference to the global focus state of the PinView. This
    *             property is used to manage the focus state of the PinView
    *             within the PinCodeView, allowing for automatic navigation
    *             between PinViews when a digit is entered.
    * - Description: This property is a reference to the global focus state of
    *                the PinView. It is used to manage the focus state of the
    *                PinView within the PinCodeView, allowing for automatic
    *                navigation between PinViews when a digit is entered.
    */
   @FocusState.Binding var pinFocusState: PinCodeView.FocusPin?
   /**
    * Indicates whether the PinView is currently being edited.
    * - Description: This property is used to manage the editing state of the
    *                PinView, allowing for dynamic changes in appearance or
    *                behavior based on user interaction.
    * - Fixme: ⚠️️ Rename to isEditing?
    */
   @State var editing: Bool = false
}
