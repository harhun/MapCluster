import Foundation
import UIKit

public extension StoryboardResourceWithInitialControllerType {
    /**
     Instantiates and returns the initial view controller in the view controller graph.

     - returns: The initial view controller in the storyboard.
     */
    func instantiateInitialViewController() -> InitialController? {
        UIStoryboard(resource: self).instantiateInitialViewController() as? InitialController
    }
}
