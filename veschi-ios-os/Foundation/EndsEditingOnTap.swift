// veschi-ios-os
// Created by Ivan B.

import UIKit

/// don't forget to call setup method from conforming class
protocol EndsEditingOnTap {
    var tapGestureRecognizer: UITapGestureRecognizer { get }
}

extension EndsEditingOnTap where Self: UIViewController {
    func setupEndEditingBehaviour() {
        tapGestureRecognizer.addTarget(self, action: #selector(endEditing))
    }
}

private extension UIViewController {
    @objc
    func endEditing() {
        view.endEditing(true)
    }
}
