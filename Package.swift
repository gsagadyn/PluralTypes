// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.
import PackageDescription

let package = Package(
    name: "PluralTypes",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(name: "PluralTypes", targets: ["PluralTypes"])
    ],
    targets: [
        .target(name: "PluralTypes", dependencies: [], path: "PluralTypes", resources: [.process("Assets")])
    ]
)
