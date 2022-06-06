import Foundation

public protocol ColorResourceType {
    /// Bundle this color is in
    var bundle: Bundle { get }

    /// Name of the color
    var name: String { get }
}

public struct ColorResource: ColorResourceType {
    /// Bundle this color is in
    public let bundle: Bundle

    /// Name of the color
    public let name: String

    public init(bundle: Bundle, name: String) {
        self.bundle = bundle
        self.name = name
    }
}
