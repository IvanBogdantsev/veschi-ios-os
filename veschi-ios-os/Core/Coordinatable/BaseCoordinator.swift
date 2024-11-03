//
//  BaseCoordinator.swift
//
//
//  Created by  Ivan B  on 16.05.23.
//

import UIKit
// not final
// swiftlint:disable:next final_class
class BaseCoordinator: NSObject, Coordinatable {
    
    let router: Router
    var children: [Coordinatable]
    
    weak var parent: Coordinatable?
    
    init(router: Router) {
        children = []
        self.router = router
        super.init()
    }
    
    func start() {}
    
    func add(_ child: Coordinatable) {
        for element in children where child === element {
            return
        }
        children.append(child)
    }
    
    func remove(_ child: Coordinatable) {
        guard !children.isEmpty else { return }
        for (index, element) in children.enumerated() where element === child {
            children.remove(at: index)
            break
        }
    }
    
    deinit {
        children.removeAll()
    }
    
}
