// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "PinKit",
    products: [
        .library(
            name: "PinKit",
            targets: ["PinKit"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "PinKit",
            dependencies: []),
        .testTarget(
            name: "PinKitTests",
            dependencies: ["PinKit"]),
    ]
)
