// veschi-ios-os
// Created by Ivan B.

import AuthenticationServices
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
    
    static func googleSignIn() -> UIButton {
        let button = BaseButton(
            title: Strings.continue_with_google,
            titleColor: Colors.googleSignInButtonText,
            image: Images.googleLogo,
            backgroundColor: Colors.googleSignInButtonBackground,
            cornerRadius: DesignConfiguration.controlElementsCornerRadius,
            borderWidth: DesignConfiguration.borderWidth,
            borderColor: Colors.googleSignInButtonBorder,
            font: Fonts.googleSignIn
        )
        button.setInsets(
            forContentPadding: UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16),
            imageTitlePadding: 12
        )
        return button
    }
    
    static func appleSignIn() -> ASAuthorizationAppleIDButton {
        return ASAuthorizationAppleIDButton(
            userInterfaceStyle: Environment.userInterfaceStyle,
            cornerRadius: DesignConfiguration.controlElementsCornerRadius,
            type: .continue
        )
    }
}
