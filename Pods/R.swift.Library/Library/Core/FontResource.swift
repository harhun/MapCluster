import Foundation

public protocol FontResourceType {
    /// Name of the font
    var fontName: String { get }
}

public struct FontResource: FontResourceType {
    /// Name of the font
    public let fontName: String

    public init(fontName: String) {
        self.fontName = fontName
    }
}
