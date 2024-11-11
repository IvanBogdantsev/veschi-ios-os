// veschi-ios-os
// Created by Ivan B.

import UIKit

enum TextFields {
    static func telephoneEntry() -> UITextField {
        return UITextField(
            keyboardType: .phonePad,
            font: Fonts.body,
            textColor: Colors.text,
            backgroundColor: Colors.background,
            accentColor: Colors.accent,
            cornerRadius: DesignConfiguration.controlElementsCornerRadius,
            borderWidth: DesignConfiguration.borderWidth,
            borderColor: Colors.border
        )
    }
}

fileprivate extension UITextField {
    convenience init(
        keyboardType: UIKeyboardType,
        placeholder: String? = nil,
        placeholderColor: UIColor = .clear,
        font: UIFont,
        textColor: UIColor,
        backgroundColor: UIColor,
        accentColor: UIColor,
        cornerRadius: CGFloat = 0,
        borderWidth: CGFloat = 0,
        borderColor: UIColor = .clear
    ) {
        self.init()
        self.keyboardType = keyboardType
        self.placeholder = placeholder
        self.font = font
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.tintColor = accentColor
        self.layer.cornerRadius = cornerRadius
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor.cgColor
        if let placeholder {
            let attributes: [NSAttributedString.Key: Any] = [
                .foregroundColor: placeholderColor,
                .font: font
            ]
            self.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        }
    }
}
