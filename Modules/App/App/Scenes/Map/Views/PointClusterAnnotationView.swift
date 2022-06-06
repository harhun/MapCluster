import Cluster
import Constants
import MapKit
import Resources

// MARK: - Constants

private extension DataConstants {
    var smallImage: UIImage? { Resources.images.smallHouse() }
    var mediumImage: UIImage? { Resources.images.mediumHouse() }
    var bigImage: UIImage? { Resources.images.bigHouse() }
    var largeImage: UIImage? { Resources.images.largeHouse() }
}

private extension GridConstants {
    var smallSize: CGSize { .init(width: 30, height: 25) }
    var mediumSize: CGSize { .init(width: 40, height: 30) }
    var bigSize: CGSize { .init(width: 50, height: 35) }
    var largeSize: CGSize { .init(width: 60, height: 40) }
}

// MARK: - PointClusterAnnotationView

class PointClusterAnnotationView: ClusterAnnotationView {
    override func configure() {
        guard let annotation = annotation as? ClusterAnnotation else { return }
        let count = annotation.annotations.count
        let data = self.data(for: count)

        self.image = data.image
        self.frame.size = data.size
    }

    private func data(for count: Int) -> (image: UIImage?, size: CGSize) {
        switch count {
        case 11 ... 20:
            return (self.data.mediumImage, grid.mediumSize)

        case 21 ... 30:
            return (self.data.bigImage, grid.bigSize)

        case 31 ... .max:
            return (self.data.largeImage, grid.largeSize)

        default:
            return (self.data.smallImage, grid.smallSize)
        }
    }
}
