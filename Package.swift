// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "BMW-i3",
  products: [
    .executable(name: "i3", targets: ["Run"])
  ],
  dependencies: [
    .package(
      url: "https://github.com/vapor/vapor.git",
      .upToNextMajor(from: "2.2.0")
    ),
    .package(
      url: "https://github.com/vapor/mysql-provider.git",
      .upToNextMajor(from: "2.0.0")
    ),
    .package(
      url: "https://github.com/BrettRToomey/Jobs.git",
      .upToNextMajor(from: "1.1.2")
    ),
  ],
  targets: [
    // Request and response models from ConnectedDrive
    .target(
      name: "ConnectedDrive"
    ),
    .testTarget(
      name: "ConnectedDriveTests",
      dependencies: ["ConnectedDrive"]
    ),
    // The brains
    .target(
      name: "i3",
      dependencies: [
        "ConnectedDrive",
        "Jobs",
        "MySQLProvider",
        "Vapor"
      ]
    ),
    // The executable
    .target(
      name: "Run",
      dependencies: [
        "i3",
        "MySQLProvider",
        "Vapor"
      ]
    )
  ]
)
