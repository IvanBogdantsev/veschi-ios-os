//  veschi-ios-os
//  Created by Ivan B.

import UIKit

final class BaseNavigationController: UINavigationController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBarAppearance()
    }
    
    private func setNavigationBarAppearance() {
        navigationBar.tintColor = Colors.accent
    }
    
}
