//  veschi-ios-os
//  Created by Ivan B.

import UIKit

extension UIStackView {
    convenience init(axis: NSLayoutConstraint.Axis, spacing: CGFloat = 0) {
        self.init()
        self.axis = axis
        self.spacing = spacing
    }
    
    func addArrangedSubviews(_ subviews: UIView...) {
        subviews.forEach { addArrangedSubview($0) }
    }
}
