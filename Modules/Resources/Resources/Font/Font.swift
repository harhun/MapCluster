import UIKit

// MARK: - FontType

public enum FontType: String {
    case black = "Black"
    case medium = "Medium"
    case light = "Light"
    case extraLight = "ExtraLight"
    case thin = "Thin"
    case bold = "Bold"
    case semiBold = "SemiBold"
    case extraBold = "ExtraBold"
    case regular = "Regular"
    case italic = "Italic"
}

// MARK: - Fonts used within the app

public extension R {
    static let saira = "Saira"

    static func font(
        of name: String = R.saira,
        type: FontType = .regular,
        size: CGFloat
    ) -> UIFont {
        getFont(baseFontName: name, type: type, size: size)
    }
}

// MARK: - Convenience methods

extension R {
    // swiftlint:disable force_unwrapping
    static func getFont(
        baseFontName: String,
        type: FontType,
        size: CGFloat
    ) -> UIFont {
        UIFont(name: "\(baseFontName)-\(type.rawValue)", size: size)!
    }

    // swiftlint:enable force_unwrapping
}
