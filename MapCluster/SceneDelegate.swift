import App
import Core
import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?

    private var coordinator: Coordinator!
    private var assembly: BaseAssembly?

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else {
            return
        }
        window = UIWindow(windowScene: windowScene)

        guard let window = window else { return }

        self.setupApp(window: window)
    }

    // MARK: - Private methods

    func setupApp(window: UIWindow) {
        let commonAssembly = self.setupAppAssembly()
        self.coordinator = commonAssembly.coordinator()

        window.rootViewController = self.coordinator.rootViewController
        self.window = window
        window.makeKeyAndVisible()
        self.coordinator.start()

        self.assembly = commonAssembly
    }

    // MARK: - Assembly

    func setupAppAssembly() -> AppAssemblyImpl {
        AppAssemblyImpl()
    }

    func sceneDidDisconnect(_ scene: UIScene) {}

    func sceneDidBecomeActive(_ scene: UIScene) {}

    func sceneWillResignActive(_ scene: UIScene) {}

    func sceneWillEnterForeground(_ scene: UIScene) {}

    func sceneDidEnterBackground(_ scene: UIScene) {}
}
