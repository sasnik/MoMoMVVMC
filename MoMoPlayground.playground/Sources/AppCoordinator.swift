import UIKit

public class AppCoordinator {
    
    private let window: UIWindow

    private var current: Coordinator?

    public init(window: UIWindow) {
        self.window = window
    }

    public func start() {
        let coordinator = MyCoordinator()
        current = coordinator
        window.rootViewController = coordinator.start()
        window.makeKeyAndVisible()
    }
}


