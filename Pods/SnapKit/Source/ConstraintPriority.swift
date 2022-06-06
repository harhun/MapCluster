#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

public struct ConstraintPriority: ExpressibleByFloatLiteral, Equatable, Strideable {
    public typealias FloatLiteralType = Float

    public let value: Float

    public init(floatLiteral value: Float) {
        self.value = value
    }

    public init(_ value: Float) {
        self.value = value
    }

    public static var required: ConstraintPriority {
        1000.0
    }

    public static var high: ConstraintPriority {
        750.0
    }

    public static var medium: ConstraintPriority {
        #if os(OSX)
            return 501.0
        #else
            return 500.0
        #endif
    }

    public static var low: ConstraintPriority {
        250.0
    }

    public static func == (lhs: ConstraintPriority, rhs: ConstraintPriority) -> Bool {
        lhs.value == rhs.value
    }

    // MARK: Strideable

    public func advanced(by n: FloatLiteralType) -> ConstraintPriority {
        ConstraintPriority(floatLiteral: self.value + n)
    }

    public func distance(to other: ConstraintPriority) -> FloatLiteralType {
        other.value - self.value
    }
}
