//
//  UIView.swift
//
//
//  Created by Vanya Bogdantsev on 16.08.2023.
//

import UIKit.UIView

extension UIView {
    func findSubview(ofType theClass: AnyClass) -> UIView? {
        for subview in self.subviews {
            if subview.isKind(of: theClass) {
                return subview
            }
        }
        return nil
    }
    
    func findSubviews(ofType theClass: AnyClass) -> [UIView] {
        var foundViews = [UIView]()
        for subview in self.subviews {
            if subview.isKind(of: theClass) {
                foundViews.append(subview)
            }
        }
        return foundViews
    }
    /// Changes view's alpha to 1.
    func show(animated: Bool, duration: TimeInterval = AnimationDuration.zeroThreeSecond.timeInterval,
              completion: ((Bool) -> Void)? = nil) {
        let withDuration: TimeInterval = animated ? duration : 0
        UIView.animate(withDuration: withDuration, animations: {
            self.alpha = 1
        }, completion: completion)
    }
    /// Changes view's alpha to 0.
    func hide(animated: Bool, duration: TimeInterval = AnimationDuration.zeroThreeSecond.timeInterval,
              completion: ((Bool) -> Void)? = nil) {
        let withDuration: TimeInterval = animated ? duration : 0
        UIView.animate(withDuration: withDuration, animations: {
            self.alpha = 0
        }, completion: completion)
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
