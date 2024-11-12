// veschi-ios-os
// Created by Ivan B.

import UIKit
// not final
// swiftlint:disable:next final_class
class BaseTextField: UITextField {
    
    let borderColor: UIColor
    let textInsets = DesignConfiguration.textFieldTextInsets
    
    init(
        keyboardType: UIKeyboardType,
        returnKeyType: UIReturnKeyType = .default,
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
        self.borderColor = borderColor
        super.init(frame: .zero)
        self.keyboardType = keyboardType
        self.returnKeyType = returnKeyType
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
        
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: textInsets)
    }
    
    func setup() {
        addTarget(self, action: #selector(didBeginEditing), for: .editingDidBegin)
        addTarget(self, action: #selector(didEndEditing), for: .editingDidEnd)
    }
    
    @objc
    private func didBeginEditing() {
        UIView.animate(withDuration: AnimationDuration.zeroPointTwoSecond) {
            self.layer.borderColor = self.tintColor.cgColor
        }
    }
    
    @objc
    private func didEndEditing() {
        UIView.animate(withDuration: AnimationDuration.zeroPointOneSecond) {
            self.layer.borderColor = self.borderColor.cgColor
        }
    }
    
}
