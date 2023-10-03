// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AlertViewCustom",
    platforms: [
        .iOS(.v14),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "AlertViewCustom",
            targets: ["AlertViewCustom"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "AlertViewCustom",
            dependencies: [])
    ]
)
