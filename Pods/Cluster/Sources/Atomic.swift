import Foundation

@propertyWrapper
class Atomic<Value> {
    private let queue = DispatchQueue(label: "Atomic serial queue", attributes: .concurrent)

    private var _value: Value

    init(wrappedValue value: Value) {
        self._value = value
    }

    var wrappedValue: Value {
        get { self.queue.sync { _value } }
        set { self.queue.async(flags: .barrier) { self._value = newValue } }
    }
}
