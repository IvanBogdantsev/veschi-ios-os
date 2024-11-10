// veschi-ios-os
// Created by Ivan B.

import SkeletonView
import UIKit

extension UIButton {
    func showLoading(titleFillPercent: Int = 100) {
        // otherwise title wont be created
        setTitle(" ", for: .normal)
        titleLabel?.skeletonTextLineHeight = SkeletonTextLineHeight.relativeToFont
        titleLabel?.lastLineFillPercent = titleFillPercent
        titleLabel?.veschi_skeleton_showAnimatedGradient()
    }
}
