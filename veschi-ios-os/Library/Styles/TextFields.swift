// veschi-ios-os
// Created by Ivan B.

import UIKit

enum TextFields {
    static func telephoneEntry() -> UITextField {
        return BaseTextField(
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
