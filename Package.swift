// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SwiftSecurityToolkit",
    platforms: [.iOS(.v17), .macOS(.v14)],
    products: [
        .library(name: "SwiftSecurityToolkit", targets: ["SwiftSecurityToolkit"]),
    ],
    targets: [
        .target(name: "SwiftSecurityToolkit"),
        .testTarget(name: "SwiftSecurityToolkitTests", dependencies: ["SwiftSecurityToolkit"]),
    ]
)
