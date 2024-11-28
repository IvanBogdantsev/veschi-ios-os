//  veschi-ios-os
//  Created by Ivan B.

import UIKit

extension UIStackView {
    convenience init(
        axis: NSLayoutConstraint.Axis,
        spacing: CGFloat = 0,
        distribution: UIStackView.Distribution = .fill
    ) {
        self.init()
        self.axis = axis
        self.spacing = spacing
        self.distribution = distribution
    }
    
    func addArrangedSubviews(_ subviews: UIView...) {
        subviews.forEach { addArrangedSubview($0) }
    }
}
