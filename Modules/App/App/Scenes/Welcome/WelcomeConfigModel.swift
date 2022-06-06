import Core
import Foundation
import UseCases

// MARK: - WelcomeInputInterface

protocol WelcomeInputInterface: BaseInputInterface {}

// MARK: - WelcomeOutputInterface

protocol WelcomeOutputInterface: BaseOutputInterface {
    func showMap()
}

// MARK: - WelcomeConfigModel

final class WelcomeConfigModel: BaseConfigModel<WelcomeInputInterface, WelcomeOutputInterface> {
    var preferencesUseCase: PreferencesUseCase

    init(output: WelcomeOutputInterface?, preferencesUseCase: PreferencesUseCase) {
        self.preferencesUseCase = preferencesUseCase

        super.init(output: output)
    }
}
