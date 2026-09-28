// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WireGuardKit",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(name: "WireGuardKit", targets: ["WireGuardKit"])
    ],
    dependencies: [],
    targets: [
        // Spans the three source directories the podspec combines into one pod, so the SwiftPM
        // and CocoaPods module surfaces match. WireGuardNetworkExtension carries
        // WireGuardTunnelProvider, which consumers subclass.
        .target(
            name: "WireGuardKit",
            dependencies: ["WireGuardKitGo", "WireGuardKitC"],
            path: "Sources",
            exclude: [
                "WireGuardApp",
                "WireGuardNetworkExtension/Info.plist",
                "WireGuardNetworkExtension/WireGuardNetworkExtension_iOS.entitlements",
                "WireGuardNetworkExtension/WireGuardNetworkExtension_macOS.entitlements"
            ],
            sources: ["WireGuardKit", "Shared", "WireGuardNetworkExtension"]
        ),
        .target(
            name: "WireGuardKitC",
            dependencies: [],
            path: "Sources/WireGuardKitC",
            publicHeadersPath: "."
        ),
        .target(
            name: "WireGuardKitGo",
            dependencies: ["wg-go"],
            path: "Sources/WireGuardKitGo",
            exclude: [
                "goruntime-boottime-over-monotonic.diff",
                "go.mod",
                "go.sum",
                "api-apple.go",
                "Makefile"
            ],
            publicHeadersPath: "."
        ),
        // The podspec vendors this same xcframework via vendored_frameworks.
        .binaryTarget(name: "wg-go", path: "Frameworks/wg-go.xcframework")
    ]
)
