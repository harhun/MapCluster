import Foundation

// MARK: - RootAssembly

public protocol RootAssembly {
    var appNavigation: UINavigationController { get }
}

// MARK: - RootAssemblyImpl

public class RootAssemblyImpl: RootAssembly {
    public lazy var appNavigation: UINavigationController = {
        UINavigationController()
    }()

    public init() {}
}
