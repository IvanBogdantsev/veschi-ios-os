//  veschi-ios-os
//  Created by Ivan B.

import SkeletonView
import UIKit

extension UIView {
    func findSubview(ofType type: AnyClass) -> UIView? {
        return subviews.first(where: { $0.isKind(of: type) })
    }
    
    func findSubviews(ofType type: AnyClass) -> [UIView] {
        return self.subviews.filter { $0.isKind(of: type) }
    }
    
    func setAlpha(
        to alpha: CGFloat,
        withDuration duration: TimeInterval,
        completion: ((Bool) -> Void)? = nil
    ) {
        UIView.animate(
            withDuration: duration,
            animations: {
                self.alpha = alpha
            },
            completion: completion
        )
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
    
    func veschi_skeleton_showAnimatedGradient() {
        if !isSkeletonable { isSkeletonable.toggle() }
        showAnimatedGradientSkeleton(
            usingGradient: SkeletonGradient(colors: Colors.skeletonAnimatedGradientSequence),
            animation: SkeletonAnimationBuilder().makeSlidingAnimation(withDirection: .leftRight),
            transition: .crossDissolve(DesignConfiguration.skeletonAnimationTransitionDuration)
        )
    }
    
    func veschi_skeleton_hideSkeleton() {
        hideSkeleton(transition: .crossDissolve(DesignConfiguration.skeletonAnimationTransitionDuration))
    }
}
