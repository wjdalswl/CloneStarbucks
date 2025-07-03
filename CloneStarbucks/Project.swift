import ProjectDescription

let project = Project(
    name: "CloneStarbucks",
    packages: [
        .remote(url: "https://github.com/Alamofire/Alamofire.git", requirement: .upToNextMajor(from: "5.10.0"))
    ],
    targets: [
        .target(
            name: "CloneStarbucks",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.CloneStarbucks",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["CloneStarbucks/Sources/**"],
            resources: ["CloneStarbucks/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "CloneStarbucksTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.CloneStarbucksTests",
            infoPlist: .default,
            sources: ["CloneStarbucks/Tests/**"],
            resources: [],
            dependencies: [.target(name: "CloneStarbucks")]
        ),
    ]
)
