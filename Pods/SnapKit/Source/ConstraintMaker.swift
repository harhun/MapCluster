#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

public class ConstraintMaker {
    public var left: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.left)
    }

    public var top: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.top)
    }

    public var bottom: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.bottom)
    }

    public var right: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.right)
    }

    public var leading: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.leading)
    }

    public var trailing: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.trailing)
    }

    public var width: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.width)
    }

    public var height: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.height)
    }

    public var centerX: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.centerX)
    }

    public var centerY: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.centerY)
    }

    @available(*, deprecated, message: "Use lastBaseline instead")
    public var baseline: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.lastBaseline)
    }

    public var lastBaseline: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.lastBaseline)
    }

    @available(iOS 8.0, OSX 10.11, *)
    public var firstBaseline: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.firstBaseline)
    }

    @available(iOS 8.0, *)
    public var leftMargin: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.leftMargin)
    }

    @available(iOS 8.0, *)
    public var rightMargin: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.rightMargin)
    }

    @available(iOS 8.0, *)
    public var topMargin: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.topMargin)
    }

    @available(iOS 8.0, *)
    public var bottomMargin: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.bottomMargin)
    }

    @available(iOS 8.0, *)
    public var leadingMargin: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.leadingMargin)
    }

    @available(iOS 8.0, *)
    public var trailingMargin: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.trailingMargin)
    }

    @available(iOS 8.0, *)
    public var centerXWithinMargins: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.centerXWithinMargins)
    }

    @available(iOS 8.0, *)
    public var centerYWithinMargins: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.centerYWithinMargins)
    }

    public var edges: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.edges)
    }

    public var directionalEdges: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.directionalEdges)
    }

    public var size: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.size)
    }

    public var center: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.center)
    }

    @available(iOS 8.0, *)
    public var margins: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.margins)
    }

    @available(iOS 8.0, *)
    public var directionalMargins: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.directionalMargins)
    }

    @available(iOS 8.0, *)
    public var centerWithinMargins: ConstraintMakerExtendable {
        self.makeExtendableWithAttributes(.centerWithinMargins)
    }

    private let item: LayoutConstraintItem
    private var descriptions = [ConstraintDescription]()

    internal init(item: LayoutConstraintItem) {
        self.item = item
        self.item.prepare()
    }

    internal func makeExtendableWithAttributes(_ attributes: ConstraintAttributes) -> ConstraintMakerExtendable {
        let description = ConstraintDescription(item: self.item, attributes: attributes)
        self.descriptions.append(description)
        return ConstraintMakerExtendable(description)
    }

    internal static func prepareConstraints(item: LayoutConstraintItem, closure: (_ make: ConstraintMaker) -> Void) -> [Constraint] {
        let maker = ConstraintMaker(item: item)
        closure(maker)
        var constraints: [Constraint] = []
        for description in maker.descriptions {
            guard let constraint = description.constraint else {
                continue
            }
            constraints.append(constraint)
        }
        return constraints
    }

    internal static func makeConstraints(item: LayoutConstraintItem, closure: (_ make: ConstraintMaker) -> Void) {
        let constraints = self.prepareConstraints(item: item, closure: closure)
        for constraint in constraints {
            constraint.activateIfNeeded(updatingExisting: false)
        }
    }

    internal static func remakeConstraints(item: LayoutConstraintItem, closure: (_ make: ConstraintMaker) -> Void) {
        self.removeConstraints(item: item)
        self.makeConstraints(item: item, closure: closure)
    }

    internal static func updateConstraints(item: LayoutConstraintItem, closure: (_ make: ConstraintMaker) -> Void) {
        guard item.constraints.count > 0 else {
            self.makeConstraints(item: item, closure: closure)
            return
        }

        let constraints = self.prepareConstraints(item: item, closure: closure)
        for constraint in constraints {
            constraint.activateIfNeeded(updatingExisting: true)
        }
    }

    internal static func removeConstraints(item: LayoutConstraintItem) {
        let constraints = item.constraints
        for constraint in constraints {
            constraint.deactivateIfNeeded()
        }
    }
}
