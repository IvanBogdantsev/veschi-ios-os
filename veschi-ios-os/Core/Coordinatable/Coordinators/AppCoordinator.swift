//  veschi-ios-os
//  Created by Ivan B.

import UIKit

final class AppCoordinator: BaseCoordinator {
    
    private weak var window: UIWindow?
    
    init(window: UIWindow) {
        let navigationController = BaseNavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
        super.init(router: Router(rootController: navigationController))
    }
    
    override func start() {
        router.setRootModule(SplashViewController())
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            let authCoordinator = AuthCoordinator(router: self.router)
            self.add(authCoordinator)
            authCoordinator.start()
        }
    }
    
}
