import CoreLocation
import Foundation

public struct LocationPoint {
    public let id: Int
    public let location: CLLocationCoordinate2D

    public init(
        id: Int,
        location: CLLocationCoordinate2D
    ) {
        self.id = id
        self.location = location
    }
}
