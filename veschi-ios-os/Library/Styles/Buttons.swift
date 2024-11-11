// veschi-ios-os
// Created by Ivan B.

import SnapKit
import UIKit

enum Buttons {
    static func leftAligned(title: String? = nil) -> UIButton {
        let button = UIButton(
            title: title,
            titleColor: Colors.text,
            backgroundColor: Colors.background,
            cornerRadius: DesignConfiguration.controlElementsCornerRadius,
            borderWidth: DesignConfiguration.borderWidth,
            borderColor: Colors.accent,
            font: Fonts.body
        )
        button.titleLabel?.snp.makeConstraints { make in make.left.right.equalToSuperview().inset(DesignConfiguration.buttonInternalElementsSideInset)
        }
        return button
    }
}

fileprivate extension UIButton {
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
