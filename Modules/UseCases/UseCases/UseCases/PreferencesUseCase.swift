import Models

// MARK: - PreferencesUseCase

public protocol PreferencesUseCase {
    func setAppState(isDevelop: Bool)
}

// MARK: - PreferencesUseCaseImpl

class PreferencesUseCaseImpl: BaseUsecase {
    // MARK: Lifecycle

    override init(unsecure: UnsecurePropertiesService) {
        super.init(unsecure: unsecure)
    }
}

// MARK: - PreferencesUseCase

extension PreferencesUseCaseImpl: PreferencesUseCase {
    public func setAppState(isDevelop: Bool) {
        unsecure.push(key: .isDevelop, value: isDevelop)
    }
}
