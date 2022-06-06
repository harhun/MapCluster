typealias Action = () -> Void

// MARK: - Background task

func backgroundTask(
    queue: DispatchQueue = DispatchQueue.global(qos: .userInitiated),
    _ request: @escaping Action
) {
    queue.async {
        request()
    }
}

// MARK: - Foreground task

func foregroundTask(force: Bool = false, _ request: @escaping Action) {
    if Thread.isMainThread, !force {
        request()
    } else {
        DispatchQueue.main.async(execute: request)
    }
}
