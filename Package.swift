// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "ACarousel",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "ACarousel",
            targets: ["ACarousel"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "ACarousel",
            dependencies: [])
    ]
)
