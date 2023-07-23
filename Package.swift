// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "WebServiceBuilder",
    platforms: [
       .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "WebServiceBuilder",
            targets: ["WebServiceBuilder"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/vapor/vapor.git", from: "4.0.0"),
        .package(url: "https://github.com/vapor/fluent.git", from: "4.0.0"),
    ],
    targets: [
        .target(
            name: "WebServiceBuilder",
            dependencies: [
                .product(name: "Vapor", package: "vapor"),
                .product(name: "Fluent", package: "fluent"),
            ]
        ),
    ]
)
