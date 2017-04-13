// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "GcdEtude",
    targets: [
        Target(name: "GcdEtude", dependencies: ["Fetcher", "Reducer", "Sleeper"]),
    ]
)
