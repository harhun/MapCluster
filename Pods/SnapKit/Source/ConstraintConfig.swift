#if os(iOS) || os(tvOS)
    import UIKit
    public typealias ConstraintInterfaceLayoutDirection = UIUserInterfaceLayoutDirection
#else
    import AppKit
    public typealias ConstraintInterfaceLayoutDirection = NSUserInterfaceLayoutDirection
#endif

public enum ConstraintConfig {
    public static var interfaceLayoutDirection: ConstraintInterfaceLayoutDirection = .leftToRight
}
