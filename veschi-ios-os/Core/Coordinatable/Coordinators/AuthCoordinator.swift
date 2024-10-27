//
//  AuthCoordinator.swift
//  veschi-ios-os
//
//  Created by Vanya Bogdantsev on 23.10.2024.
//

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
