import Constants
import Core
import Extensions
import UIKit

// MARK: - Constants

private extension GridConstants {}

private extension DataConstants {}

private extension ApperanceConstants {}

// MARK: - SplashViewInterface

protocol SplashViewControllerInterface: BaseViewControllerInterface {}

// MARK: - SplashViewController

final class SplashViewController: BaseViewController<SplashViewInterface, SplashViewModelInterface> {
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        hideNavBar()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        showNavBar()
    }

    override func setup() {
        super.setup()

        pinContent()
    }
}

// MARK: - SplashViewController

extension SplashViewController: SplashViewControllerInterface {}
