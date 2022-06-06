import Core
import Resources
import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        self.setNavBar()

        return true
    }

    private func setNavBar() {
        let font = Resources.font(type: .medium, size: 18)

        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: font]
        UINavigationBar.appearance().isTranslucent = true
        UINavigationBar.appearance().shadowImage = .init()
        UINavigationBar.appearance().setBackgroundImage(.init(), for: .default)
        UINavigationBar.appearance().tintColor = .black

        // Hide backButton text
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: UIColor.clear],
            for: .normal
        )
        UIBarButtonItem.appearance().setTitleTextAttributes(
            [NSAttributedString.Key.foregroundColor: UIColor.clear],
            for: UIControl.State.highlighted
        )
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(
        _ application: UIApplication,
        didDiscardSceneSessions sceneSessions: Set<UISceneSession>
    ) {}
}
