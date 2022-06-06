import Foundation
import UIKit

public extension NibResourceType {
    /**
     Instantiate the nib to get the top-level objects from this nib

     - parameter ownerOrNil: The owner, if the owner parameter is nil, connections to File's Owner are not permitted.
     - parameter options: Options are identical to the options specified with -[NSBundle loadNibNamed:owner:options:]

     - returns: An array containing the top-level objects from the NIB
     */
    func instantiate(withOwner ownerOrNil: Any?, options optionsOrNil: [UINib.OptionsKey: Any]? = [:]) -> [Any] {
        UINib(resource: self).instantiate(withOwner: ownerOrNil, options: optionsOrNil)
    }
}
