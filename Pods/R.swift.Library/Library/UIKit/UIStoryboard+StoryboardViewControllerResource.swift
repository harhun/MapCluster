import Foundation
import UIKit

public extension UIStoryboard {
    /**
     Instantiates and returns the view controller with the specified resource (R.storyboard.*.*).

     - parameter resource: An resource (R.storyboard.*.*) that uniquely identifies the view controller in the storyboard file. If the specified resource does not exist in the storyboard file, this method raises an exception.

     - returns: The view controller corresponding to the specified resource (R.storyboard.*.*). If no view controller is associated, this method throws an exception.
     */
    func instantiateViewController<ViewControllerResource: StoryboardViewControllerResourceType>(withResource resource: ViewControllerResource) -> ViewControllerResource.ViewControllerType? {
        self.instantiateViewController(withIdentifier: resource.identifier) as? ViewControllerResource.ViewControllerType
    }
}
