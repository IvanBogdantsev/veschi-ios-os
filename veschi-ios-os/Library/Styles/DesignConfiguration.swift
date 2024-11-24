// veschi-ios-os
// Created by Ivan B.

import UIKit

enum DesignConfiguration {
    static let controlElementsCornerRadius: CGFloat = 10
    static let borderWidth: CGFloat = 1
    static let buttonInternalElementsSideInset: CGFloat = 16
    static let textFieldTextInsets = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
    static let principalActionButtonHeight: CGFloat = 50
    static let textFieldHeight: CGFloat = 50
    static let fullWidthControlElementScreenPercentage: CGFloat = 0.88
    static let stackViewVerticalSpacing: CGFloat = 16
    static let keyboardInsetToControlElements: CGFloat = 10
    static let disabledStateAlpha: CGFloat = 0.2
    static let buttonEnabledStateSwitchDuration: TimeInterval = AnimationDuration.zeroPointOneSecond
    static let transitionCrossDissolveDuration: TimeInterval = AnimationDuration.zeroPointTwoSecond
    static let skeletonAnimationTransitionDuration: TimeInterval = AnimationDuration.zeroPointThreeSecond
}
