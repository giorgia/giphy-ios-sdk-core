// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "GiphyCoreSDK",
    products: [
        .library(
            name: "GiphyCoreSDK",
            targets: ["GiphyCoreSDK"]),
    ],
    targets: [
        .target(
            name: "GiphyCoreSDK",
            dependencies: [],
            path: "./Sources"),
        .testTarget(
            name: "GiphyCoreSDKTests",
            dependencies: ["GiphyCoreSDK"],
            path: "./Tests"),
       
    ]
)
