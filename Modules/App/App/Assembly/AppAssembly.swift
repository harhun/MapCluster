import Core
import UseCases

// MARK: - AppAssembly

protocol AppAssembly: BaseAssembly {
    var rootAssembly: RootAssembly { get }

    func makeSplash(
        output: SplashOutputInterface?
    ) -> SplashViewController

    func makeWelcome(
        output: WelcomeOutputInterface?
    ) -> WelcomeViewController

    func makeMap(
        output: MapOutputInterface?
    ) -> MapViewController
}

// MARK: - AppAssemblyImpl

public final class AppAssemblyImpl: BaseAssembly {
    private let useCasesAssembly: UseCasesAssembly

    let rootAssembly: RootAssembly

    public init(
        rootAssembly: RootAssembly = RootAssemblyImpl(),
        useCasesAssembly: UseCasesAssembly = UseCasesAssemblyImpl()
    ) {
        self.rootAssembly = rootAssembly
        self.useCasesAssembly = useCasesAssembly
    }

    @available(*, unavailable)
    required init() {
        fatalError("init() has not been implemented")
    }

    public func coordinator() -> BaseCoordinator {
        AppCoordinator(assembly: self)
    }
}

// MARK: - AppAssembly

extension AppAssemblyImpl: AppAssembly {
    func makeSplash(
        output: SplashOutputInterface?
    ) -> SplashViewController {
        SplashSceneAssembly(
            config: SplashConfigModel(
                output: output
            )
        ).controller as! SplashViewController
    }

    func makeWelcome(
        output: WelcomeOutputInterface?
    ) -> WelcomeViewController {
        WelcomeSceneAssembly(
            config: WelcomeConfigModel(
                output: output,
                preferencesUseCase: self.useCasesAssembly.preferencesUseCase
            )
        ).controller as! WelcomeViewController
    }

    func makeMap(
        output: MapOutputInterface?
    ) -> MapViewController {
        MapSceneAssembly(
            config: MapConfigModel(
                output: output,
                coordinatesUseCase: self.useCasesAssembly.coordinatesUseCase
            )
        ).controller as! MapViewController
    }
}
