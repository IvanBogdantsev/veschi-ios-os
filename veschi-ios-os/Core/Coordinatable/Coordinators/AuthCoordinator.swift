//  veschi-ios-os
//  Created by Ivan B.

import UIKit

protocol AuthSceneOutput {
    func authenticate()
}

final class AuthCoordinator: BaseCoordinator {
    
    override func start() {
        let scene = AuthViewController(viewModel: DIContainer.shared.resolve())
        UIView.transition(
            with: router.rootController.view,
            duration: AnimationDuration.zeroPointOneSecond,
            options: .transitionCrossDissolve,
            animations: {
                self.router.setRootModule(scene)
            }
        )
    }
    
}

extension AuthCoordinator: AuthSceneOutput {
    func authenticate() {}
}
