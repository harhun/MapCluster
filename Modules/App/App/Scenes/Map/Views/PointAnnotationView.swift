import Constants
import Foundation
import MapKit
import Resources

// MARK: - Constants

private extension DataConstants {
    var image: UIImage? { Resources.images.oneHouse() }
}

private extension GridConstants {
    var size: CGSize { .init(width: 20, height: 20) }
}

// MARK: - PointAnnotationView

class PointAnnotationView: MKAnnotationView {
    override var annotation: MKAnnotation? {
        willSet {
            image = data.image
            frame.size = grid.size
        }
    }
}
