// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "AlertKit",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13)
    ],
    products: [
        .library(
            name: "AlertKit",
            targets: ["AlertKit"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AlertKit",
            swiftSettings: [
                .define("ALERTKIT_SPM")
            ]
        ),
        .testTarget(
            name: "AlertKitTests",
            dependencies: ["AlertKit"],
            path: "Tests"
        )
    ],
    swiftLanguageVersions: [.v5]
)

