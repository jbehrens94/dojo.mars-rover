// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "MarsRover",
    platforms: [
        .macOS(.v15)
    ],
    dependencies: [
        .package(url: "https://github.com/SimplyDanny/SwiftLintPlugins", from: "0.58.2")
    ],
    targets: [
        .target(
            name: "MarsRover",
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        ),

        .testTarget(
            name: "MarsRoverTests",
            dependencies: [
                "MarsRover"
            ],
            plugins: [
                .plugin(name: "SwiftLintBuildToolPlugin", package: "SwiftLintPlugins")
            ]
        )
    ]
)
