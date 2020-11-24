# UIKitWithSwiftUIExperiment
Experimenting how SwiftUI can be integrated into a UIKit application

# Exercises:
- [ ] Add SwiftUI `LoginView` with three UI components: Username field, Password field, and a Login button
- [ ] Add a way for the `LoginView` to let UIKit know that the Login button was pressed
- [ ] Wire up the "Show SwiftUI View Controller" table cell segue to show the SwiftUI `LoginView` full screen
- [ ] Show the `LoginView` within the Container View of the `SwiftUIContainerViewController`, so that the `LoginView` is laid out in the center of the container view.
- [ ] **(Optional: Will need Combine)** Add a `LoginViewModel` which will drive the outputs of `LoginView`. Make the Login button disabled until username and password fields are not empty
- [ ] **(Optional)** Change the size of the container view so that it matches the size of the SwiftUI `LoginView` exactly (Hint: https://stackoverflow.com/questions/56573373/swiftui-get-size-of-child)