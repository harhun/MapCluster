import Foundation

/// Represents a nib file on disk
public protocol NibResourceType {
    /// Bundle this nib is in or nil for main bundle
    var bundle: Bundle { get }

    /// Name of the nib file on disk
    var name: String { get }
}
