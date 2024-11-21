// veschi-ios-os
// Created by Ivan B.

import UIKit

extension UITextField {
    func addBarButtons(_ items: UIBarButtonItem..., includeFlexibleSpace: Bool = true) {
        let toolbar = UIToolbar()
        toolbar.items = includeFlexibleSpace ?
        [UIBarButtonItem(systemItem: .flexibleSpace)] + items : items
        toolbar.sizeToFit()
        inputAccessoryView = toolbar
    }
}
