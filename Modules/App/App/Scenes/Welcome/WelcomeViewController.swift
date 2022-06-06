import Constants
import Core
import Resources
import UIComponents

// MARK: - Constants

private extension ApperanceConstants {}

private extension GridConstants {}

private extension DataConstants {
    var shakeAlertTitle: String? { Resources.strings.devDevelopTitle() }
    var shakeAlertFirstButton: String? { Resources.strings.devEnable() }
    var shakeAlertSecondButton: String? { Resources.strings.devDisable() }
    var shakeAlertCancelButton: String? { Resources.strings.commonCancel() }
}

// MARK: - WelcomeViewInterface

protocol WelcomeViewControllerInterface: BaseViewControllerInterface {}

// MARK: - WelcomeViewController

final class WelcomeViewController: BaseViewController<WelcomeViewInterface, WelcomeViewModelInterface> {
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

    // MARK: - Shake

    override func becomeFirstResponder() -> Bool {
        true
    }

    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            showShake()
        }
    }

    // MARK: - Setup
}

// MARK: - WelcomeViewControllerInterface

extension WelcomeViewController: WelcomeViewControllerInterface {
    func showShake() {
        alert(
            data.shakeAlertTitle,
            message: nil,
            cancel: data.shakeAlertCancelButton,
            buttons: [data.shakeAlertFirstButton, data.shakeAlertSecondButton].compactMap { $0 }
        ) { [weak self] action in
            if action.title == self?.data.shakeAlertFirstButton {
                self?.viewModel.developEnableTap()
            } else if action.title == self?.data.shakeAlertSecondButton {
                self?.viewModel.developDisableTap()
            }
        }
    }
}
