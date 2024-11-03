//  veschi-ios-os
//  Created by Ivan B.

import UIKit

final class Router {
    
    var topViewController: UIViewController? {
        return rootController.topViewController
    }
    
    var rootController: BaseNavigationController
    
    required init(rootController: BaseNavigationController) {
        self.rootController = rootController
    }
    
    func present(
        _ module: UIViewController,
        animated: Bool,
        completion: (() -> Void)? = nil
    ) {
        rootController.present(module, animated: animated, completion: completion)
    }
    
    func hideBottomBarAndPush(_ controller: UIViewController, animated: Bool) {
        controller.hidesBottomBarWhenPushed = true
        rootController.pushViewController(controller, animated: animated)
    }
    
    func popViewController(animated: Bool) {
        rootController.popViewController(animated: animated)
    }
    
    func popTo(controllerIndex: Int, animated: Bool) {
        let destination = rootController.viewControllers[controllerIndex]
        rootController.popToViewController(destination, animated: animated)
    }
    
    func dismissModule(animated: Bool) {
        rootController.dismiss(animated: animated, completion: nil)
    }
    
    func disableNavigationSlide() {
        rootController.interactivePopGestureRecognizer?.isEnabled = false
    }
    
    func setRootModule(
        _ module: UIViewController,
        hideBar: Bool = false,
        animated: Bool = false
    ) {
        rootController.setViewControllers([module], animated: animated)
        rootController.isNavigationBarHidden = hideBar
    }
    
    func popToRootModule(animated: Bool) {
        rootController.popToRootViewController(animated: animated)
    }
    
    func select(tab index: Int) {
        rootController.tabBarController?.selectedIndex = index
    }
    
    func hideTabBar(hideTabBar: Bool) {
        rootController.tabBarController?.tabBar.isHidden = hideTabBar
    }
    
    func set(controllers: [UIViewController]) {
        rootController.setViewControllers(controllers, animated: false)
    }
    
    func add(controllers: [UIViewController]) {
        var currentStack = rootController.viewControllers
        currentStack.append(contentsOf: controllers)
        rootController.setViewControllers(currentStack, animated: false)
    }
    
    func pop(to viewController: AnyClass, animated: Bool) -> Bool {
        guard let index = rootController.getIndex(of: viewController) else { return false }
        popTo(controllerIndex: index, animated: animated)
        return true
    }
    
}

fileprivate extension UINavigationController {
    func getIndex(of viewController: AnyClass) -> Int? {
        viewControllers.firstIndex(where: { $0.isKind(of: viewController) })
    }
}
