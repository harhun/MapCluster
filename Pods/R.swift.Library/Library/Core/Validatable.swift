import Foundation

/// Error thrown during validation
public struct ValidationError: Error, CustomStringConvertible {
    /// Human readable description
    public let description: String

    public init(description: String) {
        self.description = description
    }
}

public protocol Validatable {
    /**
     Validates this entity and throws if it encounters an invalid situation, a validatable should also validate it sub-validatables if it has any.

     - throws: If there the configuration error a ValidationError is thrown
     */
    static func validate() throws
}
