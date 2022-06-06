#if SWIFT_PACKAGE
    import CocoaLumberjack
    import CocoaLumberjackSwiftSupport
#endif

/**
 * Replacement for Swift's `assert` function that will output a log message even when assertions
 * are disabled.
 *
 * - Parameters:
 *   - condition: The condition to test. Unlike `Swift.assert`, `condition` is always evaluated,
 *     even when assertions are disabled.
 *   - message: A string to log (using `DDLogError`) if `condition` evaluates to `false`.
 *     The default is an empty string.
 */
@inlinable
public func DDAssert(_ condition: @autoclosure () -> Bool, _ message: @autoclosure () -> String = "", level: DDLogLevel = DDDefaultLogLevel, context: Int = 0, file: StaticString = #file, function: StaticString = #function, line: UInt = #line, tag: Any? = nil, asynchronous async: Bool = false, ddlog: DDLog = DDLog.sharedInstance) {
    if !condition() {
        DDLogError(message(), level: level, context: context, file: file, function: function, line: line, tag: tag, asynchronous: async, ddlog: ddlog)
        Swift.assertionFailure(message(), file: file, line: line)
    }
}

/**
 * Replacement for Swift's `assertionFailure` function that will output a log message even
 * when assertions are disabled.
 *
 * - Parameters:
 *   - message: A string to log (using `DDLogError`). The default is an empty string.
 */
@inlinable
public func DDAssertionFailure(_ message: @autoclosure () -> String = "", level: DDLogLevel = DDDefaultLogLevel, context: Int = 0, file: StaticString = #file, function: StaticString = #function, line: UInt = #line, tag: Any? = nil, asynchronous async: Bool = false, ddlog: DDLog = DDLog.sharedInstance) {
    DDLogError(message(), level: level, context: context, file: file, function: function, line: line, tag: tag, asynchronous: async, ddlog: ddlog)
    Swift.assertionFailure(message(), file: file, line: line)
}
