#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

public extension ConstraintView {
    @available(*, deprecated, message: "Use newer snp.* syntax.")
    var snp_left: ConstraintItem { self.snp.left }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    var snp_top: ConstraintItem { self.snp.top }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    var snp_right: ConstraintItem { self.snp.right }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    var snp_bottom: ConstraintItem { self.snp.bottom }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    var snp_leading: ConstraintItem { self.snp.leading }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    var snp_trailing: ConstraintItem { self.snp.trailing }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    var snp_width: ConstraintItem { self.snp.width }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    var snp_height: ConstraintItem { self.snp.height }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    var snp_centerX: ConstraintItem { self.snp.centerX }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    var snp_centerY: ConstraintItem { self.snp.centerY }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    var snp_baseline: ConstraintItem { self.snp.baseline }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    @available(iOS 8.0, OSX 10.11, *)
    var snp_lastBaseline: ConstraintItem { self.snp.lastBaseline }

    @available(iOS, deprecated, message: "Use newer snp.* syntax.")
    @available(iOS 8.0, OSX 10.11, *)
    var snp_firstBaseline: ConstraintItem { self.snp.firstBaseline }

    @available(iOS, deprecated, message: "Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snp_leftMargin: ConstraintItem { self.snp.leftMargin }

    @available(iOS, deprecated, message: "Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snp_topMargin: ConstraintItem { self.snp.topMargin }

    @available(iOS, deprecated, message: "Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snp_rightMargin: ConstraintItem { self.snp.rightMargin }

    @available(iOS, deprecated, message: "Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snp_bottomMargin: ConstraintItem { self.snp.bottomMargin }

    @available(iOS, deprecated, message: "Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snp_leadingMargin: ConstraintItem { self.snp.leadingMargin }

    @available(iOS, deprecated, message: "Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snp_trailingMargin: ConstraintItem { self.snp.trailingMargin }

    @available(iOS, deprecated, message: "Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snp_centerXWithinMargins: ConstraintItem { self.snp.centerXWithinMargins }

    @available(iOS, deprecated, message: "Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snp_centerYWithinMargins: ConstraintItem { self.snp.centerYWithinMargins }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    var snp_edges: ConstraintItem { self.snp.edges }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    var snp_size: ConstraintItem { self.snp.size }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    var snp_center: ConstraintItem { self.snp.center }

    @available(iOS, deprecated, message: "Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snp_margins: ConstraintItem { self.snp.margins }

    @available(iOS, deprecated, message: "Use newer snp.* syntax.")
    @available(iOS 8.0, *)
    var snp_centerWithinMargins: ConstraintItem { self.snp.centerWithinMargins }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    func snp_prepareConstraints(_ closure: (_ make: ConstraintMaker) -> Void) -> [Constraint] {
        self.snp.prepareConstraints(closure)
    }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    func snp_makeConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
        self.snp.makeConstraints(closure)
    }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    func snp_remakeConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
        self.snp.remakeConstraints(closure)
    }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    func snp_updateConstraints(_ closure: (_ make: ConstraintMaker) -> Void) {
        self.snp.updateConstraints(closure)
    }

    @available(*, deprecated, message: "Use newer snp.* syntax.")
    func snp_removeConstraints() {
        self.snp.removeConstraints()
    }

    var snp: ConstraintViewDSL {
        ConstraintViewDSL(view: self)
    }
}
