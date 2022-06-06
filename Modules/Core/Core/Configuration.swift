public struct Configuration {
    private enum Constants {
        enum PlistKeys {
            static let bundleShortVersion = "CFBundleShortVersionString"
            static let bundleBuildVersion = "CFBundleVersion"
            static let bundleAppName = "CFBundleName"
            static let coordinates = "Coordinates"
            static let googleKey = "GoogleMapKey"
        }
    }

    // MARK: Public

    public static let shared = Configuration.readConfig()

    public let appVersion: String
    public let appBundle: String
    public let appName: String

    public let coordinates: String
    public let googleKey: String

    // MARK: Private

    private static func readConfig() -> Configuration {
        guard let infoDict = Bundle.main.infoDictionary else {
            fatalError("Unable to read config at info.plist file ")
        }
        let keys = Constants.PlistKeys.self
        guard
            let shortVersion: String = Convert.get(key: keys.bundleShortVersion, from: infoDict),
            let buildVersion: String = Convert.get(key: keys.bundleBuildVersion, from: infoDict),
            let appBundle: String = Convert.from(Bundle.main.bundleIdentifier),
            let appName: String = Convert.get(key: keys.bundleAppName, from: infoDict),
            let coordinates: String = Convert.get(key: keys.coordinates, from: infoDict),
            let googleKey: String = Convert.get(key: keys.googleKey, from: infoDict)
        else {
            fatalError("Unable to convert config")
        }

        return Configuration(
            appVersion: "\(shortVersion)(\(buildVersion))",
            appBundle: appBundle,
            appName: appName,
            coordinates: coordinates,
            googleKey: googleKey
        )
    }
}
