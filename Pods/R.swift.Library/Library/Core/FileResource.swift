import Foundation

public protocol FileResourceType {
    /// Bundle this file is in
    var bundle: Bundle { get }

    /// Name of the file file on disk
    var name: String { get }

    /// Extension of the file on disk
    var pathExtension: String { get }
}

public extension FileResourceType {
    /// Name of the file on disk with the pathExtension
    var fullName: String {
        [name, pathExtension].joined(separator: ".")
    }

    /**
     Returns the full pathname for this resource.

     - returns: The full pathname for this resource or nil if the file could not be located.
     */
    func path() -> String? {
        bundle.path(forResource: self)
    }

    /**
     Returns the file URL for this resource.

     - returns: The file URL for this resource or nil if the file could not be located.
     */
    func url() -> URL? {
        bundle.url(forResource: self)
    }
}

public struct FileResource: FileResourceType {
    /// Bundle this file is in
    public let bundle: Bundle

    /// Name of the file on disk, without the pathExtension
    public let name: String

    /// Extension of the file on disk
    public let pathExtension: String

    public init(bundle: Bundle, name: String, pathExtension: String) {
        self.bundle = bundle
        self.name = name
        self.pathExtension = pathExtension
    }
}
