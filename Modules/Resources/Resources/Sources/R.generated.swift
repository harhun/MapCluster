import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
public struct R: Rswift.Validatable {
    fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
    fileprivate static let hostingBundle = Bundle(for: R.Class.self)

    /// Find first language and bundle for which the table exists
    fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
        // Filter preferredLanguages to localizations, use first locale
        var languages = preferredLanguages
            .map { Locale(identifier: $0) }
            .prefix(1)
            .flatMap { locale -> [String] in
                if hostingBundle.localizations.contains(locale.identifier) {
                    if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
                        return [locale.identifier, language]
                    } else {
                        return [locale.identifier]
                    }
                } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
                    return [language]
                } else {
                    return []
                }
            }

        // If there's no languages, use development language as backstop
        if languages.isEmpty {
            if let developmentLocalization = hostingBundle.developmentLocalization {
                languages = [developmentLocalization]
            }
        } else {
            // Insert Base as second item (between locale identifier and languageCode)
            languages.insert("Base", at: 1)

            // Add development language as backstop
            if let developmentLocalization = hostingBundle.developmentLocalization {
                languages.append(developmentLocalization)
            }
        }

        // Find first language for which table exists
        // Note: key might not exist in chosen language (in that case, key will be shown)
        for language in languages {
            if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
               let lbundle = Bundle(url: lproj) {
                let strings = lbundle.url(forResource: tableName, withExtension: "strings")
                let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

                if strings != nil || stringsdict != nil {
                    return (Locale(identifier: language), lbundle)
                }
            }
        }

        // If table is available in main bundle, don't look for localized resources
        let strings = self.hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
        let stringsdict = self.hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

        if strings != nil || stringsdict != nil {
            return (self.applicationLocale, self.hostingBundle)
        }

        // If table is not found for requested languages, key will be shown
        return nil
    }

    /// Load string from Info.plist file
    fileprivate static func infoPlistString(path: [String], key: String) -> String? {
        var dict = self.hostingBundle.infoDictionary
        for step in path {
            guard let obj = dict?[step] as? [String: Any] else { return nil }
            dict = obj
        }
        return dict?[key] as? String
    }

    public static func validate() throws {
        try intern.validate()
    }

    /// This `R.color` struct is generated, and contains static references to 5 colors.
    public struct color {
        /// Color `c000000`.
        public static let c000000 = Rswift.ColorResource(bundle: R.hostingBundle, name: "c000000")
        /// Color `c007AFF`.
        public static let c007AFF = Rswift.ColorResource(bundle: R.hostingBundle, name: "c007AFF")
        /// Color `c8E8E93`.
        public static let c8E8E93 = Rswift.ColorResource(bundle: R.hostingBundle, name: "c8E8E93")
        /// Color `cF6F0E5`.
        public static let cF6F0E5 = Rswift.ColorResource(bundle: R.hostingBundle, name: "cF6F0E5")
        /// Color `cFFFFFF`.
        public static let cFFFFFF = Rswift.ColorResource(bundle: R.hostingBundle, name: "cFFFFFF")

        #if os(iOS) || os(tvOS)
            /// `UIColor(named: "c000000", bundle: ..., traitCollection: ...)`
            @available(tvOS 11.0, *)
            @available(iOS 11.0, *)
            public static func c000000(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
                UIKit.UIColor(resource: R.color.c000000, compatibleWith: traitCollection)
            }
        #endif

        #if os(iOS) || os(tvOS)
            /// `UIColor(named: "c007AFF", bundle: ..., traitCollection: ...)`
            @available(tvOS 11.0, *)
            @available(iOS 11.0, *)
            public static func c007AFF(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
                UIKit.UIColor(resource: R.color.c007AFF, compatibleWith: traitCollection)
            }
        #endif

        #if os(iOS) || os(tvOS)
            /// `UIColor(named: "c8E8E93", bundle: ..., traitCollection: ...)`
            @available(tvOS 11.0, *)
            @available(iOS 11.0, *)
            public static func c8E8E93(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
                UIKit.UIColor(resource: R.color.c8E8E93, compatibleWith: traitCollection)
            }
        #endif

        #if os(iOS) || os(tvOS)
            /// `UIColor(named: "cF6F0E5", bundle: ..., traitCollection: ...)`
            @available(tvOS 11.0, *)
            @available(iOS 11.0, *)
            public static func cF6F0E5(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
                UIKit.UIColor(resource: R.color.cF6F0E5, compatibleWith: traitCollection)
            }
        #endif

        #if os(iOS) || os(tvOS)
            /// `UIColor(named: "cFFFFFF", bundle: ..., traitCollection: ...)`
            @available(tvOS 11.0, *)
            @available(iOS 11.0, *)
            public static func cFFFFFF(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIColor? {
                UIKit.UIColor(resource: R.color.cFFFFFF, compatibleWith: traitCollection)
            }
        #endif

        #if os(watchOS)
            /// `UIColor(named: "c000000", bundle: ..., traitCollection: ...)`
            @available(watchOSApplicationExtension 4.0, *)
            public static func c000000(_: Void = ()) -> UIKit.UIColor? {
                UIKit.UIColor(named: R.color.c000000.name)
            }
        #endif

        #if os(watchOS)
            /// `UIColor(named: "c007AFF", bundle: ..., traitCollection: ...)`
            @available(watchOSApplicationExtension 4.0, *)
            public static func c007AFF(_: Void = ()) -> UIKit.UIColor? {
                UIKit.UIColor(named: R.color.c007AFF.name)
            }
        #endif

        #if os(watchOS)
            /// `UIColor(named: "c8E8E93", bundle: ..., traitCollection: ...)`
            @available(watchOSApplicationExtension 4.0, *)
            public static func c8E8E93(_: Void = ()) -> UIKit.UIColor? {
                UIKit.UIColor(named: R.color.c8E8E93.name)
            }
        #endif

        #if os(watchOS)
            /// `UIColor(named: "cF6F0E5", bundle: ..., traitCollection: ...)`
            @available(watchOSApplicationExtension 4.0, *)
            public static func cF6F0E5(_: Void = ()) -> UIKit.UIColor? {
                UIKit.UIColor(named: R.color.cF6F0E5.name)
            }
        #endif

        #if os(watchOS)
            /// `UIColor(named: "cFFFFFF", bundle: ..., traitCollection: ...)`
            @available(watchOSApplicationExtension 4.0, *)
            public static func cFFFFFF(_: Void = ()) -> UIKit.UIColor? {
                UIKit.UIColor(named: R.color.cFFFFFF.name)
            }
        #endif

        fileprivate init() {}
    }

    /// This `R.image` struct is generated, and contains static references to 5 images.
    public struct image {
        /// Image `bigHouse`.
        public static let bigHouse = Rswift.ImageResource(bundle: R.hostingBundle, name: "bigHouse")
        /// Image `largeHouse`.
        public static let largeHouse = Rswift.ImageResource(bundle: R.hostingBundle, name: "largeHouse")
        /// Image `mediumHouse`.
        public static let mediumHouse = Rswift.ImageResource(bundle: R.hostingBundle, name: "mediumHouse")
        /// Image `oneHouse`.
        public static let oneHouse = Rswift.ImageResource(bundle: R.hostingBundle, name: "oneHouse")
        /// Image `smallHouse`.
        public static let smallHouse = Rswift.ImageResource(bundle: R.hostingBundle, name: "smallHouse")

        #if os(iOS) || os(tvOS)
            /// `UIImage(named: "bigHouse", bundle: ..., traitCollection: ...)`
            public static func bigHouse(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
                UIKit.UIImage(resource: R.image.bigHouse, compatibleWith: traitCollection)
            }
        #endif

        #if os(iOS) || os(tvOS)
            /// `UIImage(named: "largeHouse", bundle: ..., traitCollection: ...)`
            public static func largeHouse(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
                UIKit.UIImage(resource: R.image.largeHouse, compatibleWith: traitCollection)
            }
        #endif

        #if os(iOS) || os(tvOS)
            /// `UIImage(named: "mediumHouse", bundle: ..., traitCollection: ...)`
            public static func mediumHouse(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
                UIKit.UIImage(resource: R.image.mediumHouse, compatibleWith: traitCollection)
            }
        #endif

        #if os(iOS) || os(tvOS)
            /// `UIImage(named: "oneHouse", bundle: ..., traitCollection: ...)`
            public static func oneHouse(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
                UIKit.UIImage(resource: R.image.oneHouse, compatibleWith: traitCollection)
            }
        #endif

        #if os(iOS) || os(tvOS)
            /// `UIImage(named: "smallHouse", bundle: ..., traitCollection: ...)`
            public static func smallHouse(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
                UIKit.UIImage(resource: R.image.smallHouse, compatibleWith: traitCollection)
            }
        #endif

        fileprivate init() {}
    }

    /// This `R.string` struct is generated, and contains static references to 1 localization tables.
    public struct string {
        /// This `R.string.localizable` struct is generated, and contains static references to 14 localization keys.
        public struct localizable {
            /// en translation: Cluster
            ///
            /// Locales: en
            public static let splashTitle = Rswift.StringResource(key: "Splash.title", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
            /// en translation: Ok
            ///
            /// Locales: en
            public static let commonOk = Rswift.StringResource(key: "Common.ok", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
            /// en translation: Pежим разработчика
            ///
            /// Locales: en
            public static let devDevelopTitle = Rswift.StringResource(key: "Dev.developTitle", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
            /// en translation: Включить
            ///
            /// Locales: en
            public static let devEnable = Rswift.StringResource(key: "Dev.enable", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
            /// en translation: Выключить
            ///
            /// Locales: en
            public static let devDisable = Rswift.StringResource(key: "Dev.disable", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
            /// en translation: Данные повреждены. Пожалуйста, обратитесь к разработчику.
            ///
            /// Locales: en
            public static let errorInvalidData = Rswift.StringResource(key: "Error.invalidData", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
            /// en translation: Карта
            ///
            /// Locales: en
            public static let mapTitle = Rswift.StringResource(key: "Map.title", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
            /// en translation: Неизвестная ошибка.
            ///
            /// Locales: en
            public static let errorUnknown = Rswift.StringResource(key: "Error.unknown", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
            /// en translation: Открыть карту
            ///
            /// Locales: en
            public static let welcomeShowMap = Rswift.StringResource(key: "Welcome.showMap", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
            /// en translation: Отмена
            ///
            /// Locales: en
            public static let commonCancel = Rswift.StringResource(key: "Common.cancel", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
            /// en translation: Ошибка
            ///
            /// Locales: en
            public static let commonError = Rswift.StringResource(key: "Common.error", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
            /// en translation: Ошибка сервера. Пожалуйста, повторите попытку.
            ///
            /// Locales: en
            public static let errorServerError = Rswift.StringResource(key: "Error.serverError", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
            /// en translation: Успешно
            ///
            /// Locales: en
            public static let successTitle = Rswift.StringResource(key: "Success.title", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)
            /// en translation: Файл с координатами поврежден. Пожалуйста, обратитесь к разработчику.
            ///
            /// Locales: en
            public static let errorFileCorrupted = Rswift.StringResource(key: "Error.fileCorrupted", tableName: "Localizable", bundle: R.hostingBundle, locales: ["en"], comment: nil)

            /// en translation: Cluster
            ///
            /// Locales: en
            public static func splashTitle(preferredLanguages: [String]? = nil) -> String {
                guard let preferredLanguages = preferredLanguages else {
                    return NSLocalizedString("Splash.title", bundle: hostingBundle, comment: "")
                }

                guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
                    return "Splash.title"
                }

                return NSLocalizedString("Splash.title", bundle: bundle, comment: "")
            }

            /// en translation: Ok
            ///
            /// Locales: en
            public static func commonOk(preferredLanguages: [String]? = nil) -> String {
                guard let preferredLanguages = preferredLanguages else {
                    return NSLocalizedString("Common.ok", bundle: hostingBundle, comment: "")
                }

                guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
                    return "Common.ok"
                }

                return NSLocalizedString("Common.ok", bundle: bundle, comment: "")
            }

            /// en translation: Pежим разработчика
            ///
            /// Locales: en
            public static func devDevelopTitle(preferredLanguages: [String]? = nil) -> String {
                guard let preferredLanguages = preferredLanguages else {
                    return NSLocalizedString("Dev.developTitle", bundle: hostingBundle, comment: "")
                }

                guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
                    return "Dev.developTitle"
                }

                return NSLocalizedString("Dev.developTitle", bundle: bundle, comment: "")
            }

            /// en translation: Включить
            ///
            /// Locales: en
            public static func devEnable(preferredLanguages: [String]? = nil) -> String {
                guard let preferredLanguages = preferredLanguages else {
                    return NSLocalizedString("Dev.enable", bundle: hostingBundle, comment: "")
                }

                guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
                    return "Dev.enable"
                }

                return NSLocalizedString("Dev.enable", bundle: bundle, comment: "")
            }

            /// en translation: Выключить
            ///
            /// Locales: en
            public static func devDisable(preferredLanguages: [String]? = nil) -> String {
                guard let preferredLanguages = preferredLanguages else {
                    return NSLocalizedString("Dev.disable", bundle: hostingBundle, comment: "")
                }

                guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
                    return "Dev.disable"
                }

                return NSLocalizedString("Dev.disable", bundle: bundle, comment: "")
            }

            /// en translation: Данные повреждены. Пожалуйста, обратитесь к разработчику.
            ///
            /// Locales: en
            public static func errorInvalidData(preferredLanguages: [String]? = nil) -> String {
                guard let preferredLanguages = preferredLanguages else {
                    return NSLocalizedString("Error.invalidData", bundle: hostingBundle, comment: "")
                }

                guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
                    return "Error.invalidData"
                }

                return NSLocalizedString("Error.invalidData", bundle: bundle, comment: "")
            }

            /// en translation: Карта
            ///
            /// Locales: en
            public static func mapTitle(preferredLanguages: [String]? = nil) -> String {
                guard let preferredLanguages = preferredLanguages else {
                    return NSLocalizedString("Map.title", bundle: hostingBundle, comment: "")
                }

                guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
                    return "Map.title"
                }

                return NSLocalizedString("Map.title", bundle: bundle, comment: "")
            }

            /// en translation: Неизвестная ошибка.
            ///
            /// Locales: en
            public static func errorUnknown(preferredLanguages: [String]? = nil) -> String {
                guard let preferredLanguages = preferredLanguages else {
                    return NSLocalizedString("Error.unknown", bundle: hostingBundle, comment: "")
                }

                guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
                    return "Error.unknown"
                }

                return NSLocalizedString("Error.unknown", bundle: bundle, comment: "")
            }

            /// en translation: Открыть карту
            ///
            /// Locales: en
            public static func welcomeShowMap(preferredLanguages: [String]? = nil) -> String {
                guard let preferredLanguages = preferredLanguages else {
                    return NSLocalizedString("Welcome.showMap", bundle: hostingBundle, comment: "")
                }

                guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
                    return "Welcome.showMap"
                }

                return NSLocalizedString("Welcome.showMap", bundle: bundle, comment: "")
            }

            /// en translation: Отмена
            ///
            /// Locales: en
            public static func commonCancel(preferredLanguages: [String]? = nil) -> String {
                guard let preferredLanguages = preferredLanguages else {
                    return NSLocalizedString("Common.cancel", bundle: hostingBundle, comment: "")
                }

                guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
                    return "Common.cancel"
                }

                return NSLocalizedString("Common.cancel", bundle: bundle, comment: "")
            }

            /// en translation: Ошибка
            ///
            /// Locales: en
            public static func commonError(preferredLanguages: [String]? = nil) -> String {
                guard let preferredLanguages = preferredLanguages else {
                    return NSLocalizedString("Common.error", bundle: hostingBundle, comment: "")
                }

                guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
                    return "Common.error"
                }

                return NSLocalizedString("Common.error", bundle: bundle, comment: "")
            }

            /// en translation: Ошибка сервера. Пожалуйста, повторите попытку.
            ///
            /// Locales: en
            public static func errorServerError(preferredLanguages: [String]? = nil) -> String {
                guard let preferredLanguages = preferredLanguages else {
                    return NSLocalizedString("Error.serverError", bundle: hostingBundle, comment: "")
                }

                guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
                    return "Error.serverError"
                }

                return NSLocalizedString("Error.serverError", bundle: bundle, comment: "")
            }

            /// en translation: Успешно
            ///
            /// Locales: en
            public static func successTitle(preferredLanguages: [String]? = nil) -> String {
                guard let preferredLanguages = preferredLanguages else {
                    return NSLocalizedString("Success.title", bundle: hostingBundle, comment: "")
                }

                guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
                    return "Success.title"
                }

                return NSLocalizedString("Success.title", bundle: bundle, comment: "")
            }

            /// en translation: Файл с координатами поврежден. Пожалуйста, обратитесь к разработчику.
            ///
            /// Locales: en
            public static func errorFileCorrupted(preferredLanguages: [String]? = nil) -> String {
                guard let preferredLanguages = preferredLanguages else {
                    return NSLocalizedString("Error.fileCorrupted", bundle: hostingBundle, comment: "")
                }

                guard let (_, bundle) = localeBundle(tableName: "Localizable", preferredLanguages: preferredLanguages) else {
                    return "Error.fileCorrupted"
                }

                return NSLocalizedString("Error.fileCorrupted", bundle: bundle, comment: "")
            }

            fileprivate init() {}
        }

        fileprivate init() {}
    }

    fileprivate struct intern: Rswift.Validatable {
        fileprivate static func validate() throws {
            // There are no resources to validate
        }

        fileprivate init() {}
    }

    fileprivate class Class {}

    fileprivate init() {}
}

public struct _R {
    private init() {}
}
