#if DEBUG // Only used for debugging in preview etc
import SwiftUI
/**
 * Used to preview "light-mode" and "dark-mode" simultaniously
 * - Description: A container view that allows the simultaneous
 *                preview of content in both light and dark
 *                modes for SwiftUI views. This is particularly
 *                useful for designers and developers to visualize
 *                how UI components will look in different color
 *                schemes during the development phase.
 * - Note: We might also test multiple devices at the same time:
 *         https://www.hackingwithswift.com/quick-start/swiftui/how-to-preview-your-layout-in-different-devices
 * - Important: ⚠️️ This is used by alot of code. Careful when tweaking things
 * - Example: To use `PreviewContainer` to preview a `Text` view in both light and dark modes, you can write:
 *   ```swift
 *   PreviewContainer {
 *       Text("Hello, World!")
 *   }
 *   ```
 * - Fixme: ⚠️️ Rename to something better like? or keep as is?
 * - Fixme: ⚠️️ Add support for both VStack and HStack, toggle it with a bool in init? or a generic bool?
 * - Fixme: ⚠️️ Move dark to top and light to bottom? or keep as is?
 * - Fixme: ⚠️️ Split into multiple files?
 * - Fixme: ⚠️️ Potentially make it opensource? 👈
 */
internal struct PreviewContainer<Content: View>: View {
   /**
    * The content view to be previewed in both light and dark modes.
    * - Description: This property holds the view that will be
    *               rendered in both light and dark modes for
    *               preview purposes.
    */
   internal let content: Content
   /**
    * A closure that returns the content view to be previewed.
    * - Description: This closure is used to initialize the
    *               content that will be displayed in the
    *               preview container. It allows for dynamic
    *               content creation using a closure that
    *               returns a `View`.
    * - Returns: The content view to be previewed.
    */
   internal typealias ContentAlias = () -> Content
   /**
    * init
    * - Description: Initializes a new instance of the
    *                PreviewContainer with the provided
    *                content. The content is specified
    *                through a closure that returns a
    *                `View`, allowing for dynamic content
    *                generation.
    * - Parameter content: The content view to be previewed.
    */
   internal init(@ViewBuilder content: ContentAlias) {
      self.content = content() // - Fixme: ⚠️️ Maybe delay this until needed?
   }
   /**
    * Body
    * - Description: The body of the PreviewContainer view.
    *               It uses a ZStack to layer the content
    *               views in light and dark modes for
    *               simultaneous previewing. This setup is
    *               essential for visualizing the appearance
    *               of UI components under different color
    *               schemes directly in SwiftUI previews.
    */
   @ViewBuilder
   internal var body: some View {
      ZStack {
         Rectangle() // A rectangle to fill the background
            .fill(Color.secondaryBackground) // Fills the rectangle with a secondary background color
            .ignoresSafeArea(.all) // Ignores the safe area on all sides
         VStack(spacing: .zero) { // A vertical stack with no spacing
            content // The content view
               .environment(\.colorScheme, .light) // Sets the environment to light mode
            content // The content view again
               .environment(\.colorScheme, .dark) // Sets the environment to dark mode
         }
      }
   }
}
/**
 * Preview (example usage)
 * - Description: This section of the code provides an
 *                example usage of the `PreviewContainer`
 *                struct, demonstrating how to preview a
 *                simple button in both light and dark modes.
 */
#Preview {
   PreviewContainer {
      Button(action: {
         Swift.print("on action")
      }, label: {
         Text( "Hello world")
         Spacer()
      })
      .padding(16/*Measure.margin*/)
      .background(Color.blackOrWhite)
   }
   .environment(\.colorScheme, .dark) // Sets the environment to dark mode
}
#endif
