import Core
import CoreLocation
import MapKit
import Models
import TabularData

// MARK: - CoordinatesUseCase

public protocol CoordinatesUseCase {
    func getCoordinates(
        loading: @escaping LoadingProcess,
        completion: @escaping UICompletionResult<[LocationPoint]>
    )
}

// MARK: - CoordinatesUseCaseImpl

class CoordinatesUseCaseImpl: BaseUsecase {
    // MARK: Lifecycle

    override init(unsecure: UnsecurePropertiesService) {
        super.init(unsecure: unsecure)
    }
}

// MARK: - CoordinatesUseCase

extension CoordinatesUseCaseImpl: CoordinatesUseCase {
    func getCoordinates(
        loading: @escaping LoadingProcess,
        completion: @escaping UICompletionResult<[LocationPoint]>
    ) {
        loading(.inProcess)

        backgroundTask { [weak self] in
            guard let url = Bundle.main.url(
                forResource: Configuration.shared.coordinates,
                withExtension: "csv"
            ) else {
                completion(.error(.fileCorrupted))
                return
            }

            self?.parseFile(url: url, loading: loading, completion: completion)
        }
    }

    private func parseFile(
        url: URL,
        loading: @escaping LoadingProcess,
        completion: @escaping UICompletionResult<[LocationPoint]>
    ) {
        do {
            let idColumn = ColumnID("id", Int.self)
            let latColumn = ColumnID("lat", Double.self)
            let lngColumn = ColumnID("lng", Double.self)

            var result = try DataFrame(
                contentsOfCSVFile: url,
                columns: [idColumn.name, latColumn.name, lngColumn.name],
                types: [
                    idColumn.name: .integer,
                    latColumn.name: .double,
                    lngColumn.name: .double
                ]
            )

            let locations: [LocationPoint] = result.rows.compactMap { row in
                guard
                    let id = row[idColumn],
                    let lat = row[latColumn],
                    let lng = row[lngColumn]
                else { return nil }

                return LocationPoint(
                    id: id,
                    location: CLLocationCoordinate2D(latitude: lat, longitude: lng)
                )
            }

            foregroundTask {
                loading(.ended)
                completion(.value(locations))
            }
        } catch {
            foregroundTask {
                loading(.ended)
                completion(.error(.invalidData))
            }
        }
    }
}
