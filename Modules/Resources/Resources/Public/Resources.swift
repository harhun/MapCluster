import Foundation

public enum Resources {
    public static var strings: R.string.localizable.Type { R.string.localizable.self }
    public static var images: R.image.Type { R.image.self }
    public static var colors: R.color.Type { R.color.self }

    // MARK: - Fonts

    public static func font(of name: String, type: FontType, size: CGFloat) -> UIFont {
        R.font(of: name, type: type, size: size)
    }

    public static func font(type: FontType, size: CGFloat) -> UIFont {
        R.font(type: type, size: size)
    }

    public static func font(of name: String, size: CGFloat) -> UIFont {
        R.font(of: name, size: size)
    }

    public static func font(size: CGFloat) -> UIFont {
        R.font(size: size)
    }
}
