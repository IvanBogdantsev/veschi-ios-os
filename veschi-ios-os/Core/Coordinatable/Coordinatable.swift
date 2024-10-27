//
//  Coordinatable.swift
//  
//
//  Created by  Ivan B  on 16.05.23.
//

import UIKit

protocol Coordinatable: AnyObject {
    var parent: Coordinatable? { get }
    var children: [Coordinatable] { get }
    
    func add(_ child: Coordinatable)
    func remove(_ child: Coordinatable)
    func start()
}
