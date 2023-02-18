// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "UIKitHelper",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "UIKitHelper",
            targets: ["UIKitHelper"]
        ),
    ],
    targets: [
        .target(
            name: "UIKitHelper",
            dependencies: []
        ),
        .testTarget(
            name: "UIKitHelperTests",
            dependencies: ["UIKitHelper"]
        ),
    ]
)
