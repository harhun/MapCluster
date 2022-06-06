/// Протокол для основных числовых констант для верстки содержащий цвета, альфы и прочее
public protocol ApperanceConstants {}

/// Содержит основные базовые числовые константы
public extension ApperanceConstants {
    var clearColor: UIColor { .clear }
    var whiteColor: UIColor { .white }
    var blackColor: UIColor { .black }
}

/// Обертка для ApperanceConstant совместимых типов
public struct ApperanceConstantsWrapper<Base>: ApperanceConstants {
    private let base: Base

    init(base: Base) {
        self.base = base
    }
}

/// Протокол описывающий которому должны конформить совместимы с ApperanceConstant типами
public protocol ApperanceConstantsInterface: AnyObject {}

public extension ApperanceConstantsInterface {
    /// Предоставляет namespace обертку для ApperanceConstant совместимых типов.
    var apperance: ApperanceConstantsWrapper<Self> { ApperanceConstantsWrapper(base: self) }
}

extension UIView: ApperanceConstantsInterface {}
extension UIViewController: ApperanceConstantsInterface {}
