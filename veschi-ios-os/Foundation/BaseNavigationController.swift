//  veschi-ios-os
//  Created by Ivan B.

import UIKit

final class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        navigationBar.tintColor = Colors.accent
    }
    
}
