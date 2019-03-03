// swift-tools-version:5.3
// https://github.com/apple/swift-package-manager/blob/master/Documentation/PackageDescription.md

import PackageDescription

let package = Package(
    name: "PinKit",
    products: [
        .library(
            name: "PinKit",
            targets: ["PinKit"]),
    ],
    dependencies: [
        .package(url: "git@github.com:Quick/Quick.git", .upToNextMajor(from: "3.0.0")),
        .package(url: "git@github.com:Quick/Nimble.git", .upToNextMajor(from: "8.1.1")),
    ],
    targets: [
        .target(
            name: "PinKit",
            dependencies: ["Result"]),
        .testTarget(
            name: "PinKitTests",
            dependencies: ["PinKit", "Quick", "Nimble"]),
    ],
    swiftLanguageVersions: [.v5]
)
