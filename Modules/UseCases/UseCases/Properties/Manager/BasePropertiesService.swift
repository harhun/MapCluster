import Foundation

public class BasePropertiesService {
    private let manager: PropertiesManager

    init(type: PropertiesManager.`Type`) {
        self.manager = PropertiesManager(type: type)
    }

    func pull<Value: Codable>(key: String) -> Value? {
        self.manager[key]
    }

    func push<Value: Codable>(key: String, value: Value) {
        self.manager[key] = value
    }

    func clean(key: String) {
        self.manager.remove(for: key)
    }
}
