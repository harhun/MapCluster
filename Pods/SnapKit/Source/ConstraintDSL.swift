#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

public protocol ConstraintDSL {
    var target: AnyObject? { get }

    func setLabel(_ value: String?)
    func label() -> String?
}

public extension ConstraintDSL {
    func setLabel(_ value: String?) {
        objc_setAssociatedObject(self.target as Any, &labelKey, value, .OBJC_ASSOCIATION_COPY_NONATOMIC)
    }

    func label() -> String? {
        objc_getAssociatedObject(self.target as Any, &labelKey) as? String
    }
}

private var labelKey: UInt8 = 0

public protocol ConstraintBasicAttributesDSL: ConstraintDSL {}

public extension ConstraintBasicAttributesDSL {
    // MARK: Basics

    var left: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.left)
    }

    var top: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.top)
    }

    var right: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.right)
    }

    var bottom: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.bottom)
    }

    var leading: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.leading)
    }

    var trailing: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.trailing)
    }

    var width: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.width)
    }

    var height: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.height)
    }

    var centerX: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.centerX)
    }

    var centerY: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.centerY)
    }

    var edges: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.edges)
    }

    var directionalEdges: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.directionalEdges)
    }

    var size: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.size)
    }

    var center: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.center)
    }
}

public protocol ConstraintAttributesDSL: ConstraintBasicAttributesDSL {}

public extension ConstraintAttributesDSL {
    // MARK: Baselines

    @available(*, deprecated, message: "Use .lastBaseline instead")
    var baseline: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.lastBaseline)
    }

    @available(iOS 8.0, OSX 10.11, *)
    var lastBaseline: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.lastBaseline)
    }

    @available(iOS 8.0, OSX 10.11, *)
    var firstBaseline: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.firstBaseline)
    }

    // MARK: Margins

    @available(iOS 8.0, *)
    var leftMargin: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.leftMargin)
    }

    @available(iOS 8.0, *)
    var topMargin: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.topMargin)
    }

    @available(iOS 8.0, *)
    var rightMargin: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.rightMargin)
    }

    @available(iOS 8.0, *)
    var bottomMargin: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.bottomMargin)
    }

    @available(iOS 8.0, *)
    var leadingMargin: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.leadingMargin)
    }

    @available(iOS 8.0, *)
    var trailingMargin: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.trailingMargin)
    }

    @available(iOS 8.0, *)
    var centerXWithinMargins: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.centerXWithinMargins)
    }

    @available(iOS 8.0, *)
    var centerYWithinMargins: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.centerYWithinMargins)
    }

    @available(iOS 8.0, *)
    var margins: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.margins)
    }

    @available(iOS 8.0, *)
    var directionalMargins: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.directionalMargins)
    }

    @available(iOS 8.0, *)
    var centerWithinMargins: ConstraintItem {
        ConstraintItem(target: self.target, attributes: ConstraintAttributes.centerWithinMargins)
    }
}
