//  veschi-ios-os
//  Created by Ivan B.

import UIKit

enum Labels {
    static func logoTitle(text: String? = nil) -> UILabel {
        return UILabel(
            text: text,
            multiline: false,
            font: Fonts.logoTitle,
            textColor: Colors.text,
            centered: true,
            adjustsFontSizeToFitWidth: true
        )
    }
}

fileprivate extension UILabel {
    convenience init(
        text: String?,
        multiline: Bool,
        font: UIFont,
        textColor: UIColor,
        centered: Bool,
        adjustsFontSizeToFitWidth: Bool
    ) {
        self.init()
        self.text = text
        self.numberOfLines = multiline ? 0 : 1
        self.font = font
        self.textColor = textColor
        self.textAlignment = centered ? .center : .left
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
    }
}
