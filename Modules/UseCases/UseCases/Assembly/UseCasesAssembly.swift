import Core

// MARK: - UseCasesAssembly

public protocol UseCasesAssembly {
    var preferencesUseCase: PreferencesUseCase { get }
    var coordinatesUseCase: CoordinatesUseCase { get }
}

// MARK: - UseCasesAssemblyImpl

public class UseCasesAssemblyImpl: UseCasesAssembly {
    private let propertiesAssembly: PropertiesAssembly

    public lazy var preferencesUseCase: PreferencesUseCase = {
        PreferencesUseCaseImpl(
            unsecure: propertiesAssembly.unsecureService
        )
    }()

    public lazy var coordinatesUseCase: CoordinatesUseCase = {
        CoordinatesUseCaseImpl(
            unsecure: propertiesAssembly.unsecureService
        )
    }()

    public convenience init() {
        self.init(
            propertiesAssembly: PropertiesAssemblyImpl()
        )
    }

    init(
        propertiesAssembly: PropertiesAssembly
    ) {
        self.propertiesAssembly = propertiesAssembly
    }
}
