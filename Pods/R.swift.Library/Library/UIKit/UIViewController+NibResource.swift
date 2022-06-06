import Foundation
import UIKit

public extension UIViewController {
    /**
      Returns a newly initialized view controller with the nib resource (R.nib.*).
   
      - parameter nib: The nib resource (R.nib.*) to associate with the view controller.
   
      - returns: A newly initialized UIViewController object.
     */
    convenience init(nib: NibResourceType) {
        self.init(nibName: nib.name, bundle: nib.bundle)
    }
}
