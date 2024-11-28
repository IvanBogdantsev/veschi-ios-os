//  veschi-ios-os
//  Created by Ivan B.

import UIKit

enum Colors {
    static let background = UIColor.systemBackground
    static let secondaryBackground = UIColor.secondarySystemBackground
    static let border = UIColor.separator
    static let text = UIColor.label
    static let secondaryText = UIColor.secondaryLabel
    static let accent = UIColor.systemBlue
    static let white = UIColor.white
    static let skeletonAnimatedGradientSequence = [
        UIColor.quaternarySystemFill,
        UIColor.tertiarySystemFill,
        UIColor.secondarySystemFill,
        UIColor.systemFill,
        UIColor.systemFill,
        UIColor.secondarySystemFill,
        UIColor.tertiarySystemFill,
        UIColor.quaternarySystemFill
    ]
}

extension Colors {
    static var googleSignInButtonBackground: UIColor {
        switch Environment.userInterfaceStyle {
        case .light: return UIColor.hex(0xFFFFFF)
        case .dark: return UIColor.hex(0x131314)
        default: return UIColor()
        }
    }
    
    static var googleSignInButtonBorder: UIColor {
        switch Environment.userInterfaceStyle {
        case .light: return UIColor.hex(0x747775)
        case .dark: return UIColor.hex(0x8E918F)
        default: return UIColor()
        }
    }
    
    static var googleSignInButtonText: UIColor {
        switch Environment.userInterfaceStyle {
        case .light: return UIColor.hex(0x1F1F1F)
        case .dark: return UIColor.hex(0xE3E3E3)
        default: return UIColor()
        }
    }
}
