//
//  AnimationDuration.swift
//  
//
//  Created by Vanya Bogdantsev on 16.08.2023.
//

import Foundation

enum AnimationDuration: TimeInterval {
    /// 0.1 sec
    case zeroOneSecond = 0.1
    /// 0.2 sec
    case zeroTwoSecond = 0.2
    /// 0.3 sec
    case zeroThreeSecond = 0.3
    /// 0.4 sec
    case zeroFourSecond = 0.4
    /// 0.5 sec
    case zeroFiveSecond = 0.5
    /// 0.6 sec
    case zeroSixSecond = 0.6
    
    var timeInterval: TimeInterval {
        return rawValue
    }
}
