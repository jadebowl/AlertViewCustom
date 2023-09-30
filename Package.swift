// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CustomAlert",
    products: [
        .library(
            name: "CustomAlert",
            targets: ["CustomAlert"]),
    ],
    dependencies: [ ],
    targets: [
        .target(
            name: "CustomAlert",
            dependencies: [])
    ]
)
