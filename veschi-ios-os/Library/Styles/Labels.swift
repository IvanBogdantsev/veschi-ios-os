//  veschi-ios-os
//  Created by Ivan B.

import UIKit

enum Labels {
    static func superLargeTitle(text: String? = nil) -> UILabel {
        return UILabel(
            text: text,
            multiline: false,
            font: Fonts.superLargeTitle,
            textColor: Colors.text,
            centered: true,
            adjustsFontSizeToFitWidth: false
        )
    }
    
    static func title(text: String? = nil) -> UILabel {
        return UILabel(
            text: text,
            multiline: true,
            font: Fonts.title,
            textColor: Colors.text,
            centered: true,
            adjustsFontSizeToFitWidth: false
        )
    }
    
    static func body(text: String? = nil) -> UILabel {
        return UILabel(
            text: text,
            multiline: true,
            font: Fonts.body,
            textColor: Colors.text,
            centered: true,
            adjustsFontSizeToFitWidth: false
        )
    }
    
    static func headline(text: String? = nil) -> UILabel {
        return UILabel(
            text: text,
            multiline: true,
            font: Fonts.headline,
            textColor: Colors.text,
            centered: true,
            adjustsFontSizeToFitWidth: false
        )
    }
    
    static func subheadline(text: String? = nil) -> UILabel {
        return UILabel(
            text: text,
            multiline: true,
            font: Fonts.subheadline,
            textColor: Colors.text,
            centered: true,
            adjustsFontSizeToFitWidth: false
        )
    }
    
    static func emojiHeader(text: String? = nil) -> UILabel {
        return UILabel(
            text: text,
            multiline: false,
            font: Fonts.emojiHeader,
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
