#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

@available(iOS 8.0, *)
public struct ConstraintLayoutSupportDSL: ConstraintDSL {
    public var target: AnyObject? {
        self.support
    }

    internal let support: ConstraintLayoutSupport

    internal init(support: ConstraintLayoutSupport) {
        self.support = support
    }

    public var top: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.top)
    }

    public var bottom: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.bottom)
    }

    public var height: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.height)
    }
}
