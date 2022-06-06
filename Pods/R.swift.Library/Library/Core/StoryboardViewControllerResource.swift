import Foundation

public protocol StoryboardViewControllerResourceType: IdentifierType {
    associatedtype ViewControllerType
}

public struct StoryboardViewControllerResource<ViewController>: StoryboardViewControllerResourceType {
    public typealias ViewControllerType = ViewController

    /// Storyboard identifier of this view controller
    public let identifier: String

    public init(identifier: String) {
        self.identifier = identifier
    }
}
