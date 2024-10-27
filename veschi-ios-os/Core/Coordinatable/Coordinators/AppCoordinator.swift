//
//  AppCoordinator.swift
//
//
//  Created by  Ivan B  on 16.05.23.
//

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
    }
    
}
