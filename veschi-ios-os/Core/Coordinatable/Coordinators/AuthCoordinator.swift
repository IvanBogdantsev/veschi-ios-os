//  veschi-ios-os
//  Created by Ivan B.

protocol AuthSceneOutput {
    func authenticate()
}

final class AuthCoordinator: BaseCoordinator {
    
    override func start() {
        let scene = AuthViewController(viewModel: DIContainer.shared.resolve())
        router.setRootModule(scene)
    }
    
}

extension AuthCoordinator: AuthSceneOutput {
    func authenticate() {}
}
