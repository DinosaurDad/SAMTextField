// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "SAMTextField",
    products: [
        .library(
          name: "SAMTextField",
          targets: ["SAMTextField"]),
    ],
    targets: [
        .target(
            name: "SAMTextField",
            dependencies: [],
            path: "SAMTextField"
        )
    ]
)
