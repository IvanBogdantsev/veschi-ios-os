//
//  SplashConfigurator.swift
//
//
//  Created by  Ivan B  on 27.05.22.
//
//

import UIKit

struct SplashAssembly: SceneAssembly {
    private let sceneOutput: SplashSceneOutput
    
    init(sceneOutput: SplashSceneOutput) {
        self.sceneOutput = sceneOutput
    }
    
    func makeScene() -> UIViewController {
        let viewController = SplashViewController()
        return viewController
    }
}
