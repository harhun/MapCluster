import Cluster
import MapKit
import Models

class PointAnnotation: Annotation {
    init(point: LocationPoint) {
        super.init()

        self.coordinate = point.location
    }
}
