import Cluster
import Constants
import Core
import Extensions
import MapKit
import Resources
import SnapKit
import UIComponents
import UIKit

// MARK: - Constants

private extension ApperanceConstants {
    var backgroundColor: UIColor? { Resources.colors.cF6F0E5() }
    var buttonColor: UIColor? { Resources.colors.c007AFF() }
}

private extension GridConstants {
    var cornerRadius: CGFloat { 14 }
    var multiplerConstraint: CGFloat { 0.7 }
}

// MARK: - MapViewInterface

protocol MapViewInterface: BaseViewInterface {
    func setupAnnotations(_ annotations: [PointAnnotation])
}

// MARK: - MapView

class MapView: BaseView<MapViewModelInterface> {
    private lazy var mapView = MKMapView().then {
        $0.register(
            PointAnnotationView.self,
            forAnnotationViewWithReuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier
        )
        $0.register(
            PointClusterAnnotationView.self,
            forAnnotationViewWithReuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier
        )
        $0.delegate = self
    }

    private lazy var manager: ClusterManager = {
        let manager = ClusterManager()
        manager.delegate = self
        manager.clusterPosition = .nearCenter
        return manager
    }()

    // MARK: -

    override func setupUI() {
        backgroundColor = apperance.clearColor

        addSubview(self.mapView)
    }

    override func setupConstraints() {
        self.mapView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}

// MARK: - MapViewInterface

extension MapView: MapViewInterface {
    func setupAnnotations(_ annotations: [PointAnnotation]) {
        self.manager.add(annotations)
        self.reload()
    }

    private func reload() {
        self.viewModel.showHud()
        self.manager.reload(mapView: self.mapView) { [weak self] _ in
            self?.viewModel.hideHud()
        }
    }
}

// MARK: - MKMapViewDelegate

extension MapView: MKMapViewDelegate {
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        self.reload()
    }

    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if let annotation = annotation as? ClusterAnnotation {
            return mapView.annotationView(
                of: PointClusterAnnotationView.self,
                annotation: annotation,
                reuseIdentifier: MKMapViewDefaultClusterAnnotationViewReuseIdentifier
            )
        } else {
            return mapView.annotationView(
                of: PointAnnotationView.self,
                annotation: annotation,
                reuseIdentifier: MKMapViewDefaultAnnotationViewReuseIdentifier
            )
        }
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard
            let annotation = view.annotation,
            let cluster = annotation as? ClusterAnnotation
        else { return }

        var zoomRect = MKMapRect.null
        cluster.annotations.forEach { annotation in
            let annotationPoint = MKMapPoint(annotation.coordinate)

            let pointRect = MKMapRect(
                x: annotationPoint.x,
                y: annotationPoint.y,
                width: .zero,
                height: .zero
            )

            if zoomRect.isNull {
                zoomRect = pointRect
            } else {
                zoomRect = zoomRect.union(pointRect)
            }
        }

        mapView.setVisibleMapRect(zoomRect, animated: true)
    }
}

// MARK: - ClusterManagerDelegate

extension MapView: ClusterManagerDelegate {
    func cellSize(for zoomLevel: Double) -> Double? {
        nil
    }

    func shouldClusterAnnotation(_ annotation: MKAnnotation) -> Bool {
        true
    }
}
