// veschi-ios-os
// Created by Ivan B.

import SnapKit
import UIKit

enum Buttons {
    /// used on the phone auth screen and looks essentially like text field
    static func leftAligned(title: String? = nil) -> UIButton {
        let button = BaseButton(
            title: title,
            titleColor: Colors.text,
            backgroundColor: Colors.background,
            cornerRadius: DesignConfiguration.controlElementsCornerRadius,
            borderWidth: DesignConfiguration.borderWidth,
            borderColor: Colors.border,
            font: Fonts.body
        )
        button.titleLabel?.snp.makeConstraints { make in make.left.right.equalToSuperview().inset(DesignConfiguration.buttonInternalElementsSideInset)
        }
        return button
    }
    
    static func mainAction(title: String? = nil) -> UIButton {
        return BaseButton(
            title: title,
            titleColor: Colors.white,
            backgroundColor: Colors.accent,
            cornerRadius: DesignConfiguration.controlElementsCornerRadius,
            font: Fonts.headline
        )
    }
}
