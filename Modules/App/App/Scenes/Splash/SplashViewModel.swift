import Core
import UseCases

// MARK: - SplashViewModelInterface

protocol SplashViewModelInterface: BaseViewModelInterface {}

// MARK: - SplashViewController

final class SplashViewModel: BaseViewModel<SplashViewController, SplashViewInterface, SplashConfigModel> {}

// MARK: - SplashViewModelInterface

extension SplashViewModel: SplashViewModelInterface {
    override func viewLoaded() {
        config.output?.showWelcome()
    }
}

// MARK: - SplashInputInterface

extension SplashViewModel: SplashInputInterface {}
