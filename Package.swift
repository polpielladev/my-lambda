// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "MyLambda",
    platforms: [.macOS(.v12)],
    dependencies: [
        .package(
            url: "https://github.com/swift-server/swift-aws-lambda-runtime.git",
            exact: "1.0.0-alpha.2"
        ),
        .package(
            url: "https://github.com/swift-server/swift-aws-lambda-events.git",
            exact: "0.4.0"
        )
    ],
    targets: [
        .executableTarget(
            name: "MyLambda",
            dependencies: [
                .product(name: "AWSLambdaRuntime", package: "swift-aws-lambda-runtime"),
                .product(name: "AWSLambdaEvents", package: "swift-aws-lambda-events")
            ]
        ),
    ]
)
