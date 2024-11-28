// veschi-ios-os
// Created by Ivan B.

import AuthenticationServices

extension ASAuthorizationAppleIDButton {
    convenience init(
        userInterfaceStyle: UIUserInterfaceStyle,
        cornerRadius: CGFloat,
        type: ASAuthorizationAppleIDButton.ButtonType
    ) {
        let style: ASAuthorizationAppleIDButton.Style = userInterfaceStyle == .dark ?
            .white :
            .black
        self.init(type: type, style: style)
        self.cornerRadius = cornerRadius
    }
}
