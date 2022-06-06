import MapKit

public extension MKMapView {
    func annotationView<T: MKAnnotationView>(
        of type: T.Type,
        annotation: MKAnnotation?,
        reuseIdentifier: String
    ) -> T {
        guard let annotationView = dequeueReusableAnnotationView(
            withIdentifier: reuseIdentifier
        ) as? T else {
            return type.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        }
        annotationView.annotation = annotation
        return annotationView
    }
}
