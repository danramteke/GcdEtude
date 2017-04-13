// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "GcdEtude",
    targets: [
        Target(name: "GcdEtude", dependencies: ["Fetcher", "Reducer", "Sleeper", "FetchResult"]),
        Target(name: "Fetcher", dependencies: ["Sleeper", "FetchResult"]),
        Target(name: "Reducer", dependencies: ["FetchResult"]),
    ]
)
