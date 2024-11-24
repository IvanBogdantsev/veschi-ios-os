//  veschi-ios-os
//  Created by Ivan B.

import UIKit

// not final
// swiftlint:disable:next final_class
class BaseView: UIView {
    
    init() {
        super.init(frame: .zero)
        layout()
        setStyles()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layout() {}
    
    func setStyles() {
        backgroundColor = Colors.background
    }
    
}
