// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterDocSeparator",
    products: [
        .library(name: "TreeSitterDocSeparator", targets: ["TreeSitterDocSeparator"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterDocSeparator",
            dependencies: [],
            path: ".",
            sources: [
                "src/parser.c",
                // NOTE: if your language has an external scanner, add it here.
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")]
        ),
        .testTarget(
            name: "TreeSitterDocSeparatorTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterDocSeparator",
            ],
            path: "bindings/swift/TreeSitterDocSeparatorTests"
        )
    ],
    cLanguageStandard: .c11
)
