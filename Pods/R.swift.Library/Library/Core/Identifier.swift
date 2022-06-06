import Foundation

/// Base protocol for all identifiers
public protocol IdentifierType: CustomStringConvertible {
    /// Identifier string
    var identifier: String { get }
}

public extension IdentifierType {
    /// CustomStringConvertible implementation, returns the identifier
    var description: String {
        identifier
    }
}
