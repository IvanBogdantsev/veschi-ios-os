// veschi-ios-os
// Created by Ivan B.

import UIKit

// not final
// swiftlint:disable:next final_class
class BaseButton: UIButton {
    
    override var isEnabled: Bool {
        didSet {
            if isEnabled {
                setAlpha(
                    to: 1,
                    withDuration: DesignConfiguration.buttonEnabledStateSwitchDuration
                )
            } else {
                setAlpha(
                    to: DesignConfiguration.disabledStateAlpha,
                    withDuration: DesignConfiguration.buttonEnabledStateSwitchDuration
                )
            }
        }
    }
    
    convenience init(
        title: String? = nil,
        titleColor: UIColor,
        image: UIImage? = nil,
        backgroundColor: UIColor,
        cornerRadius: CGFloat = 0,
        borderWidth: CGFloat = 0,
        borderColor: UIColor = .clear,
        font: UIFont
    ) {
        self.init()
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.setImage(image, for: .normal)
        self.backgroundColor = backgroundColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        self.titleLabel?.font = font
    }
    
}
