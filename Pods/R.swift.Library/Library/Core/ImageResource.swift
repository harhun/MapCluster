import Foundation

public protocol ImageResourceType {
    /// Bundle this image is in
    var bundle: Bundle { get }

    /// Name of the image
    var name: String { get }
}

public struct ImageResource: ImageResourceType {
    /// Bundle this image is in
    public let bundle: Bundle

    /// Name of the image
    public let name: String

    public init(bundle: Bundle, name: String) {
        self.bundle = bundle
        self.name = name
    }
}
