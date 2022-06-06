import Foundation

public protocol StoryboardResourceType {
    /// Bundle this storyboard is in
    var bundle: Bundle { get }

    /// Name of the storyboard file on disk
    var name: String { get }
}

public protocol StoryboardResourceWithInitialControllerType: StoryboardResourceType {
    /// Type of the inital controller
    associatedtype InitialController
}
