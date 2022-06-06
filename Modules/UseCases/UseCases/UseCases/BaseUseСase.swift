import Foundation
import Models

public class BaseUsecase {
    let unsecure: UnsecurePropertiesService

    init(
        unsecure: UnsecurePropertiesService
    ) {
        self.unsecure = unsecure
    }

    func serverError(_ error: Error) -> UIError {
        if let isDevelop: Bool = unsecure.pull(key: .isDevelop), isDevelop {
            return .developError(error.localizedDescription)
        } else {
            return UIError.convert(from: error)
        }
    }
}
