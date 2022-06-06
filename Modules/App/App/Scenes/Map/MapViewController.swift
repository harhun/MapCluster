import Constants
import Core
import Resources
import UIComponents

// MARK: - Constants

private extension ApperanceConstants {}

private extension GridConstants {}

private extension DataConstants {
    var title: String { Resources.strings.mapTitle() }
}

// MARK: - MapViewInterface

protocol MapViewControllerInterface: BaseViewControllerInterface {}

// MARK: - MapViewController

final class MapViewController: BaseViewController<MapViewInterface, MapViewModelInterface> {
    override func setup() {
        super.setup()

        pinContent()

        title = data.title
    }

    override func showHud() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            customView: self.activityIndicatorView
        )
    }

    override func hideHud() {
        navigationItem.rightBarButtonItem = nil
    }
}

// MARK: - MapViewControllerInterface

extension MapViewController: MapViewControllerInterface {}
