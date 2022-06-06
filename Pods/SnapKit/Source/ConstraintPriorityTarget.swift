#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

public protocol ConstraintPriorityTarget {
    var constraintPriorityTargetValue: Float { get }
}

extension Int: ConstraintPriorityTarget {
    public var constraintPriorityTargetValue: Float {
        Float(self)
    }
}

extension UInt: ConstraintPriorityTarget {
    public var constraintPriorityTargetValue: Float {
        Float(self)
    }
}

extension Float: ConstraintPriorityTarget {
    public var constraintPriorityTargetValue: Float {
        self
    }
}

extension Double: ConstraintPriorityTarget {
    public var constraintPriorityTargetValue: Float {
        Float(self)
    }
}

extension CGFloat: ConstraintPriorityTarget {
    public var constraintPriorityTargetValue: Float {
        Float(self)
    }
}

#if os(iOS) || os(tvOS)
    extension UILayoutPriority: ConstraintPriorityTarget {
        public var constraintPriorityTargetValue: Float {
            self.rawValue
        }
    }
#endif
