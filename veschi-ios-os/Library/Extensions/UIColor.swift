//  veschi-ios-os
//  Created by Ivan B.

import CoreGraphics
import UIKit

extension UIColor {
    static func hex(_ value: UInt32) -> UIColor {
        let red = CGFloat((value & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((value & 0xFF00) >> 8) / 255.0
        let blue = CGFloat(value & 0xFF) / 255.0
        
        return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
