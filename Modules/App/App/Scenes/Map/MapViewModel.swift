import Core
import UseCases

// MARK: - MapViewModelInterface

protocol MapViewModelInterface: BaseViewModelInterface {
    func showHud()
    func hideHud()
}

// MARK: - MapViewModel

final class MapViewModel: BaseViewModel<MapViewController, MapView, MapConfigModel> {}

// MARK: - MapViewModelInterface

extension MapViewModel: MapViewModelInterface {
    override func viewLoaded() {
        config.coordinatesUseCase.getCoordinates(
            loading: loadingProcess
        ) { [weak self] result in
            switch result {
            case .value(let points):
                self?.view.setupAnnotations(points.compactMap { PointAnnotation(point: $0) })

            case .error(let error):
                self?.controller.showError(error.message ?? "")
            }
        }
    }

    func showHud() {
        controller.showHud()
    }

    func hideHud() {
        guard loadingStatus != .inProcess else { return }
        controller.hideHud()
    }
}

// MARK: - MapInputInterface

extension MapViewModel: MapInputInterface {}
