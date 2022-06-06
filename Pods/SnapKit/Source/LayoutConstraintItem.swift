#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

public protocol LayoutConstraintItem: AnyObject {}

@available(iOS 9.0, OSX 10.11, *)
extension ConstraintLayoutGuide: LayoutConstraintItem {}

extension ConstraintView: LayoutConstraintItem {}

extension LayoutConstraintItem {
    func prepare() {
        if let view = self as? ConstraintView {
            view.translatesAutoresizingMaskIntoConstraints = false
        }
    }

    var superview: ConstraintView? {
        if let view = self as? ConstraintView {
            return view.superview
        }

        if #available(iOS 9.0, OSX 10.11, *), let guide = self as? ConstraintLayoutGuide {
            return guide.owningView
        }

        return nil
    }

    var constraints: [Constraint] {
        self.constraintsSet.allObjects as! [Constraint]
    }

    func add(constraints: [Constraint]) {
        let constraintsSet = self.constraintsSet
        for constraint in constraints {
            constraintsSet.add(constraint)
        }
    }

    func remove(constraints: [Constraint]) {
        let constraintsSet = self.constraintsSet
        for constraint in constraints {
            constraintsSet.remove(constraint)
        }
    }

    private var constraintsSet: NSMutableSet {
        let constraintsSet: NSMutableSet

        if let existing = objc_getAssociatedObject(self, &constraintsKey) as? NSMutableSet {
            constraintsSet = existing
        } else {
            constraintsSet = NSMutableSet()
            objc_setAssociatedObject(self, &constraintsKey, constraintsSet, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return constraintsSet
    }
}

private var constraintsKey: UInt8 = 0
