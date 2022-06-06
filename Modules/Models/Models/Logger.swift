import CocoaLumberjack
import Foundation

// MARK: - LogMessage

public struct LogMessage {
    public let timestamp: Date
    public let message: String
    public let flag: LoggerFlag
}

// MARK: - LoggerFlag

public enum LoggerFlag {
    case error
    case warning
    case info
    case debug
    case verbose
}

public protocol LoggerListener: AnyObject {
    func didUpdateLogs()
}

// MARK: - Logger

public class Logger: NSObject, DDLogger {
    public static let shared = Logger()
    public weak var listener: LoggerListener?

    public var logFormatter: DDLogFormatter?

    let fileLogger = DDFileLogger()

    private var storage = [DDLogMessage]()
    private var queue = DispatchQueue(label: "safe.log.storage", attributes: .concurrent)
    private var logsDirectory: String?

    override private init() {
        super.init()

        DDLog.add(DDOSLogger.sharedInstance)
        self.fileLogger.rollingFrequency = 60 * 60 * 24 * 7
        self.fileLogger.logFileManager.maximumNumberOfLogFiles = 10
        self.logsDirectory = self.fileLogger.logFileManager.logsDirectory
        DDLog.add(self.fileLogger)
        DDLog.add(self)
    }

    // NOT USE
    public func log(message logMessage: DDLogMessage) {
        self.queue.async(flags: .barrier) {
            self.storage.insert(logMessage, at: .zero)
            DispatchQueue.main.async {
                self.listener?.didUpdateLogs()
            }
        }
    }
}

public extension Logger {
    func log(message: String, flag: LoggerFlag) {
        switch flag {
        case .error:
            DDLogError(message)

        case .warning:
            DDLogWarn(message)

        case .info:
            DDLogInfo(message)

        case .debug:
            DDLogDebug(message)

        case .verbose:
            DDLogVerbose(message)
        }
    }

    func getLogs() -> [LogMessage] {
        var result: [DDLogMessage]?
        self.queue.sync {
            result = self.storage
        }
        return result?.compactMap { item in
            var flag: LoggerFlag!
            switch item.flag {
            case .error:
                flag = .error

            case .warning:
                flag = .warning

            case .info:
                flag = .info

            case .verbose:
                flag = .verbose

            default:
                flag = .debug
            }
            return LogMessage(timestamp: item.timestamp, message: item.message, flag: flag)
        } ?? []
    }

    func getLogsDirectory() -> String? {
        self.logsDirectory
    }
}
