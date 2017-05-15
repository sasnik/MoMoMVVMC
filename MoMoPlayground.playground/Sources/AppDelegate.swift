import UIKit

public class AppDelegate: UIResponder, UIApplicationDelegate {
    private let rect = CGRect(origin: .zero,
                              size: CGSize(width: 375,
                                           height: 667))

    public var window: UIWindow?

    private let appCoordinator: AppCoordinator

    override public init() {
        window = UIWindow(frame: rect)
        appCoordinator = AppCoordinator(window: window!)
        super.init()
        appCoordinator.start()
    }
}
