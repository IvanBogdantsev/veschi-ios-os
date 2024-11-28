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
    
    var contentPadding: UIEdgeInsets? {
        get {
            return value(forKey: "contentEdgeInsets") as? UIEdgeInsets
        }
        set {
            setValue(newValue, forKey: "contentEdgeInsets")
        }
    }
    
    var imagePadding: UIEdgeInsets? {
        get {
            return value(forKey: "imageEdgeInsets") as? UIEdgeInsets
        }
        set {
            setValue(newValue, forKey: "imageEdgeInsets")
        }
    }
    
    var titlePadding: UIEdgeInsets? {
        get {
            return value(forKey: "titleEdgeInsets") as? UIEdgeInsets
        }
        set {
            setValue(newValue, forKey: "titleEdgeInsets")
        }
    }
    
    convenience init(
        title: String? = nil,
        titleColor: UIColor? = nil,
        image: UIImage? = nil,
        backgroundColor: UIColor,
        cornerRadius: CGFloat = 0,
        borderWidth: CGFloat = 0,
        borderColor: UIColor = .clear,
        font: UIFont,
        adjustsFontSizeToFitWidth: Bool = false
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
        self.titleLabel?.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
    }
    
    func setInsets(
        forContentPadding padding: UIEdgeInsets,
        imageTitlePadding: CGFloat
    ) {
        contentPadding = UIEdgeInsets(
            top: padding.top,
            left: padding.left,
            bottom: padding.bottom,
            right: padding.right + imageTitlePadding
        )
        titlePadding = UIEdgeInsets(
            top: 0,
            left: imageTitlePadding,
            bottom: 0,
            right: -imageTitlePadding
        )
    }
    
}
