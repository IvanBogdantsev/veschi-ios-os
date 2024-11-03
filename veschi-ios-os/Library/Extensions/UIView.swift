//
//  UIView.swift
//
//
//  Created by Vanya Bogdantsev on 16.08.2023.
//

import UIKit

extension UIView {
    func findSubview(ofType type: AnyClass) -> UIView? {
        return subviews.first(where: { $0.isKind(of: type) })
    }
    
    func findSubviews(ofType type: AnyClass) -> [UIView] {
        return self.subviews.filter { $0.isKind(of: type) }
    }
    
    func show(
        animated: Bool,
        withDuration duration: TimeInterval = AnimationDuration.zeroPointThreeSecond,
        completion: ((Bool) -> Void)? = nil
    ) {
        let withDuration: TimeInterval = animated ? duration : 0
        UIView.animate(
            withDuration: withDuration,
            animations: {
                self.alpha = 1
            },
            completion: completion
        )
    }
    
    func hide(
        animated: Bool,
        withDuration duration: TimeInterval = AnimationDuration.zeroPointThreeSecond,
        completion: ((Bool) -> Void)? = nil
    ) {
        let withDuration: TimeInterval = animated ? duration : 0
        UIView.animate(
            withDuration: withDuration,
            animations: {
                self.alpha = 0
            },
            completion: completion
        )
    }
    
    func addSubviews(_ subviews: UIView...) {
        subviews.forEach { addSubview($0) }
    }
}
