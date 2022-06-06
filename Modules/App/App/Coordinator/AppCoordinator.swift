import Core
import UseCases

final class AppCoordinator: BaseCoordinator {
    private weak var assembly: AppAssembly?

    init(assembly: AppAssembly) {
        self.assembly = assembly

        super.init(navigationController: assembly.rootAssembly.appNavigation)
    }

    override func start() {
        guard let splash = assembly?.makeSplash(output: self) else { return }
        navigationController.setViewControllers([splash], animated: false)
    }
}

// MARK: - SplashOutputInterface

extension AppCoordinator: SplashOutputInterface {
    func showWelcome() {
        guard let welcome = assembly?.makeWelcome(output: self) else { return }
        navigationController.pushViewController(welcome, animated: true)
    }
}

// MARK: - WelcomeOutputInterface

extension AppCoordinator: WelcomeOutputInterface {
    func showMap() {
        guard let welcome = assembly?.makeMap(output: self) else { return }
        navigationController.pushViewController(welcome, animated: true)
    }
}

// MARK: - MapOutputInterface

extension AppCoordinator: MapOutputInterface {}
