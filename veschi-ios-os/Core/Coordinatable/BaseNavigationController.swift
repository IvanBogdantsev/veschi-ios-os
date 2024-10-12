//
//  BaseNavigationController.swift
//  
//
//  Created by  Ivan B  on 16.05.23.
//

import UIKit

final class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateNavigationBarAppearance()
    }
    
    private func updateNavigationBarAppearance() {}
    
}
