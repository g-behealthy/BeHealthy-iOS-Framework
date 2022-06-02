// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "BeHealthy",
    platforms: [
      .iOS(.v13)
    ],
    products: [
        .library(
            name: "BeHealthy",
            targets: ["BeHealthy"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
    ],
    targets: [
      .binaryTarget(
        name: "BeHealthy",
        path: "./Sources/BeHealthy.xcframework")
    ]
)
