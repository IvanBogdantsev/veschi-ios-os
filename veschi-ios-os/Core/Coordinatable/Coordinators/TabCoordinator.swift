//
//  TabCoordinator.swift
//
//
//  Created by Ivan B on 16.05.23.
//

import UIKit

protocol TabCoordinatorInterface: Coordinatable {
    func selectPage(_ page: TabCoordinator.TabBarPage)
    func currentPage() -> TabCoordinator.TabBarPage?
}

protocol TabCoordinatorDelegate: AnyObject {}

final class TabCoordinator: BaseCoordinator {
    
    enum TabBarPage: Int, CaseIterable {
        case TAB_NAME
        
        var tabBarItem: UITabBarItem {
            switch self {
            case .TAB_NAME:
                return UITabBarItem(
                    title: "",
                    image: nil,
                    selectedImage: nil
                )
            }
        }
    }
    
    weak var delegate: TabCoordinatorDelegate?
    
    private let navigationController: BaseNavigationController
    private let tabBarController: UITabBarController
    
    required init(navigationController: BaseNavigationController, delegate: TabCoordinatorDelegate?) {
        self.delegate = delegate
        self.navigationController = navigationController
        tabBarController = UITabBarController()
        super.init(router: Router(rootController: navigationController))
        setupAppearance()
    }
    
    override func start() {
        let controllers: [UINavigationController] = TabBarPage.allCases.map({ getTabController($0) })
        prepareTabBarController(withTabControllers: controllers)
        UIView.transition(
            with: self.router.rootController.view, //MARK: TO CHECK
            duration: AnimationDuration.zeroTwoSecond,
            options: .transitionCrossDissolve,
            animations: {
                self.router.setRootModule(self.tabBarController, hideBar: true)
            },
            completion: nil
        )
    }
    
    private func getTabController(_ page: TabBarPage) -> UINavigationController {
        let navigationController = BaseNavigationController()
        navigationController.tabBarItem = page.tabBarItem
        /*
         let router = Router(rootController: navigationController)
         switch page {
         case .map:
         let COORDINATOR_NAME = COORDINATOR(router: router)
         COORDINATOR_NAME.parent = self
         children.append(COORDINATOR_NAME)
         COORDINATOR_NAME.start()
         }
         */
        return navigationController
    }
    
    private func prepareTabBarController(withTabControllers tabControllers: [UIViewController]) {
        tabBarController.setViewControllers(tabControllers, animated: false)
        tabBarController.selectedIndex = TabBarPage.allCases.first?.rawValue ?? 0
    }
    
    private func setupAppearance() {
        navigationController.isNavigationBarHidden = true
    }
}

extension TabCoordinator: TabCoordinatorInterface {
    func currentPage() -> TabBarPage? {
        TabBarPage(rawValue: tabBarController.selectedIndex)
    }
    
    func selectPage(_ page: TabBarPage) {
        tabBarController.selectedIndex = page.rawValue
    }
    
    func setSelectedIndex(_ index: Int) {
        tabBarController.selectedIndex = index
    }
}
