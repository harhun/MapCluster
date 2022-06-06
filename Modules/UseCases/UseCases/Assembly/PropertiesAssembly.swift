import Core

// MARK: - PropertiesAssembly

protocol PropertiesAssembly {
    var unsecureService: UnsecurePropertiesService { get }
}

// MARK: - PropertiesAssemblyImpl

class PropertiesAssemblyImpl: PropertiesAssembly {
    lazy var unsecureService: UnsecurePropertiesService = {
        UnsecurePropertiesServiceImpl()
    }()
}
