// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "PinView",
    platforms: [
        .macOS(.v14), 
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "PinView",
            targets: ["PinView"]),
    ],
    dependencies: [
      .package(url: "https://github.com/sentryco/HybridColor", branch: "main"), // Dependency for HybridColor
      .package(url: "https://github.com/sentryco/HapticFeedback", branch: "main")
    ],
    targets: [
        .target(
            name: "PinView",
            dependencies: [
               .product(name: "HybridColor", package: "HybridColor"), // Dependency for HybridColor
               .product(name: "HapticFeedback", package: "HapticFeedback")
            ]
        ),
        .testTarget(
            name: "PinViewTests",
            dependencies: ["PinView"])
    ]
)
