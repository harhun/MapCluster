import Foundation

public extension UIDevice {
    static var isPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
