//  veschi-ios-os
//  Created by Ivan B.

import UIKit

protocol Coordinatable: AnyObject {
    var parent: Coordinatable? { get }
    var children: [Coordinatable] { get }
    
    func add(_ child: Coordinatable)
    func remove(_ child: Coordinatable)
    func start()
}
