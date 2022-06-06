import Foundation
import Models
import Resources

public enum UIError: Error {
    case developError(String)

    case fileCorrupted
    case invalidData

    case serverError

    case unknown

    public var message: String? {
        let strings = Resources.strings

        switch self {
        case .developError(let message):
            return message

        case .fileCorrupted:
            return Resources.strings.errorFileCorrupted()

        case .invalidData:
            return Resources.strings.errorInvalidData()

        case .unknown:
            return Resources.strings.errorUnknown()

        case .serverError:
            return Resources.strings.errorServerError()
        }
    }

    var localizedDescription: String? {
        self.message
    }

    public var code: Int? {
        nil
    }

    static func convert(from error: Error) -> UIError {
        .serverError
    }
}
