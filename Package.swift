// swift-tools-version: 5.4

import PackageDescription

let package = Package(
    name: "SPAlert",
    platforms: [
       .iOS(.v10)
    ],
    products: [
        .library(name: "SPAlert", targets: ["SPAlert"])
    ],
    targets: [
        .target(name: "SPAlert")
    ]
)

