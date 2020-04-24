// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "PinKit",
    products: [
        .library(
            name: "PinKit",
            targets: ["PinKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Quick/Quick", from: "2.2.0"),
        .package(url: "https://github.com/Quick/Nimble", from: "8.0.7"),
    ],
    targets: [
        .target(
            name: "PinKit",
            dependencies: []),
        .testTarget(
            name: "PinKitTests",
            dependencies: ["PinKit", "Quick", "Nimble"]),
    ]
)
