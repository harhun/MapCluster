import Core
import Foundation
import UseCases

// MARK: - MapInputInterface

protocol MapInputInterface: BaseInputInterface {}

// MARK: - MapOutputInterface

protocol MapOutputInterface: BaseOutputInterface {
    func showMap()
}

// MARK: - MapConfigModel

final class MapConfigModel: BaseConfigModel<MapInputInterface, MapOutputInterface> {
    var coordinatesUseCase: CoordinatesUseCase

    init(output: MapOutputInterface?, coordinatesUseCase: CoordinatesUseCase) {
        self.coordinatesUseCase = coordinatesUseCase

        super.init(output: output)
    }
}
