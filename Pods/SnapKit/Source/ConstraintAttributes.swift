#if os(iOS) || os(tvOS)
    import UIKit
#else
    import AppKit
#endif

internal struct ConstraintAttributes: OptionSet, ExpressibleByIntegerLiteral {
    typealias IntegerLiteralType = UInt

    internal init(rawValue: UInt) {
        self.rawValue = rawValue
    }

    internal init(_ rawValue: UInt) {
        self.init(rawValue: rawValue)
    }

    internal init(nilLiteral: ()) {
        self.rawValue = 0
    }

    internal init(integerLiteral rawValue: IntegerLiteralType) {
        self.init(rawValue: rawValue)
    }

    internal private(set) var rawValue: UInt
    internal static var allZeros: ConstraintAttributes { 0 }
    internal static func convertFromNilLiteral() -> ConstraintAttributes { 0 }
    internal var boolValue: Bool { self.rawValue != 0 }

    internal func toRaw() -> UInt { self.rawValue }
    internal static func fromRaw(_ raw: UInt) -> ConstraintAttributes? { self.init(raw) }
    internal static func fromMask(_ raw: UInt) -> ConstraintAttributes { self.init(raw) }

    // normal

    internal static var none: ConstraintAttributes { 0 }
    internal static var left: ConstraintAttributes { 1 }
    internal static var top: ConstraintAttributes { 2 }
    internal static var right: ConstraintAttributes { 4 }
    internal static var bottom: ConstraintAttributes { 8 }
    internal static var leading: ConstraintAttributes { 16 }
    internal static var trailing: ConstraintAttributes { 32 }
    internal static var width: ConstraintAttributes { 64 }
    internal static var height: ConstraintAttributes { 128 }
    internal static var centerX: ConstraintAttributes { 256 }
    internal static var centerY: ConstraintAttributes { 512 }
    internal static var lastBaseline: ConstraintAttributes { 1024 }

    @available(iOS 8.0, OSX 10.11, *)
    internal static var firstBaseline: ConstraintAttributes { 2048 }

    @available(iOS 8.0, *)
    internal static var leftMargin: ConstraintAttributes { 4096 }

    @available(iOS 8.0, *)
    internal static var rightMargin: ConstraintAttributes { 8192 }

    @available(iOS 8.0, *)
    internal static var topMargin: ConstraintAttributes { 16384 }

    @available(iOS 8.0, *)
    internal static var bottomMargin: ConstraintAttributes { 32768 }

    @available(iOS 8.0, *)
    internal static var leadingMargin: ConstraintAttributes { 65536 }

    @available(iOS 8.0, *)
    internal static var trailingMargin: ConstraintAttributes { 131072 }

    @available(iOS 8.0, *)
    internal static var centerXWithinMargins: ConstraintAttributes { 262144 }

    @available(iOS 8.0, *)
    internal static var centerYWithinMargins: ConstraintAttributes { 524288 }

    // aggregates

    internal static var edges: ConstraintAttributes { 15 }
    internal static var directionalEdges: ConstraintAttributes { 58 }
    internal static var size: ConstraintAttributes { 192 }
    internal static var center: ConstraintAttributes { 768 }

    @available(iOS 8.0, *)
    internal static var margins: ConstraintAttributes { 61440 }

    @available(iOS 8.0, *)
    internal static var directionalMargins: ConstraintAttributes { 245760 }

    @available(iOS 8.0, *)
    internal static var centerWithinMargins: ConstraintAttributes { 786432 }

    internal var layoutAttributes: [LayoutAttribute] {
        var attrs = [LayoutAttribute]()
        if self.contains(ConstraintAttributes.left) {
            attrs.append(.left)
        }
        if self.contains(ConstraintAttributes.top) {
            attrs.append(.top)
        }
        if self.contains(ConstraintAttributes.right) {
            attrs.append(.right)
        }
        if self.contains(ConstraintAttributes.bottom) {
            attrs.append(.bottom)
        }
        if self.contains(ConstraintAttributes.leading) {
            attrs.append(.leading)
        }
        if self.contains(ConstraintAttributes.trailing) {
            attrs.append(.trailing)
        }
        if self.contains(ConstraintAttributes.width) {
            attrs.append(.width)
        }
        if self.contains(ConstraintAttributes.height) {
            attrs.append(.height)
        }
        if self.contains(ConstraintAttributes.centerX) {
            attrs.append(.centerX)
        }
        if self.contains(ConstraintAttributes.centerY) {
            attrs.append(.centerY)
        }
        if self.contains(ConstraintAttributes.lastBaseline) {
            attrs.append(.lastBaseline)
        }

        #if os(iOS) || os(tvOS)
            if self.contains(ConstraintAttributes.firstBaseline) {
                attrs.append(.firstBaseline)
            }
            if self.contains(ConstraintAttributes.leftMargin) {
                attrs.append(.leftMargin)
            }
            if self.contains(ConstraintAttributes.rightMargin) {
                attrs.append(.rightMargin)
            }
            if self.contains(ConstraintAttributes.topMargin) {
                attrs.append(.topMargin)
            }
            if self.contains(ConstraintAttributes.bottomMargin) {
                attrs.append(.bottomMargin)
            }
            if self.contains(ConstraintAttributes.leadingMargin) {
                attrs.append(.leadingMargin)
            }
            if self.contains(ConstraintAttributes.trailingMargin) {
                attrs.append(.trailingMargin)
            }
            if self.contains(ConstraintAttributes.centerXWithinMargins) {
                attrs.append(.centerXWithinMargins)
            }
            if self.contains(ConstraintAttributes.centerYWithinMargins) {
                attrs.append(.centerYWithinMargins)
            }
        #endif

        return attrs
    }
}

internal func + (left: ConstraintAttributes, right: ConstraintAttributes) -> ConstraintAttributes {
    left.union(right)
}

internal func += (left: inout ConstraintAttributes, right: ConstraintAttributes) {
    left.formUnion(right)
}

internal func -= (left: inout ConstraintAttributes, right: ConstraintAttributes) {
    left.subtract(right)
}

internal func == (left: ConstraintAttributes, right: ConstraintAttributes) -> Bool {
    left.rawValue == right.rawValue
}
