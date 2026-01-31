// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SRT2Text",
	products: [
		.executable(name: "SRT2Text", targets: ["SRT2Text"]),
		.library(name: "SRT2TextLib", targets: ["SRT2TextLib"]),
	],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", from: "1.2.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "SRT2Text",
            dependencies: [
                .product(name: "ArgumentParser", package: "swift-argument-parser"),
				"SRT2TextLib"
            ]
        ),
		.target(name: "SRT2TextLib")
    ]
)
