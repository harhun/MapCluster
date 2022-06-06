import Core
import Foundation
import UseCases

// MARK: - SplashInputInterface

protocol SplashInputInterface: BaseInputInterface {}

// MARK: - SplashOutputInterface

protocol SplashOutputInterface: BaseOutputInterface {
    func showWelcome()
}

// MARK: - SplashInputInterface

final class SplashConfigModel: BaseConfigModel<SplashInputInterface, SplashOutputInterface> {}
