//
//  Labels.swift
//  veschi-ios-os
//
//  Created by Vanya Bogdantsev on 13.10.2024.
//

import UIKit.UILabel

enum Labels {
    static func logoTitle(text: String? = nil) -> UILabel
    {
        let label = UILabel()
        label.setup(text: text, multiline: false, font: Fonts.logoTitle, textColor: Colors.text, centered: true, adjustsFontSizeToFitWidth: true)
        return label
    }
}

fileprivate extension UILabel {
    func setup(text: String?,
               multiline: Bool,
               font: UIFont,
               textColor: UIColor,
               centered: Bool,
               adjustsFontSizeToFitWidth: Bool)
    {
        self.text = text
        self.numberOfLines = multiline ? 0 : 1
        self.font = font
        self.textColor = textColor
        self.textAlignment = centered ? .center : .left
        self.adjustsFontSizeToFitWidth = adjustsFontSizeToFitWidth
    }
}
