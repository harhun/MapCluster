import Core
import UseCases

// MARK: - WelcomeViewModelInterface

protocol WelcomeViewModelInterface: BaseViewModelInterface {
    func showMapTap()

    func developEnableTap()
    func developDisableTap()
}

// MARK: - WelcomeViewModel

final class WelcomeViewModel: BaseViewModel<WelcomeViewController, WelcomeView, WelcomeConfigModel> {}

// MARK: - WelcomeViewModelInterface

extension WelcomeViewModel: WelcomeViewModelInterface {
    func showMapTap() {
        config.output?.showMap()
    }

    func developEnableTap() {
        config.preferencesUseCase.setAppState(isDevelop: true)
    }

    func developDisableTap() {
        config.preferencesUseCase.setAppState(isDevelop: false)
    }
}

// MARK: - WelcomeInputInterface

extension WelcomeViewModel: WelcomeInputInterface {}
