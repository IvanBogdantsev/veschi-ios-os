// veschi-ios-os
// Created by Ivan B.

import UIKit

final class KeyboardIntersectionTracker {
    
    private weak var contentView: UIView?
    private weak var viewToTrack: UIView?
    
    func startTrackingIntersection(of view: UIView, in contentView: UIView) {
        self.contentView = contentView
        self.viewToTrack = view
        subscribeOnNotifications()
    }
    
    private func subscribeOnNotifications() {
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(self.keyboardDidChangeFrame(notification:)),
            name: UIResponder.keyboardWillChangeFrameNotification,
            object: nil
        )
    }
    
    @objc
    private func keyboardDidChangeFrame(notification: NSNotification) {
        guard let userInfo = notification.userInfo,
              let endFrame = (
                userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue
              )?.cgRectValue,
              let viewToTrack,
              let contentView else { return }
        
        let duration = (
            userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber
        )?.doubleValue
        let animationCurveRaw = (
            userInfo[UIResponder.keyboardAnimationCurveUserInfoKey] as? NSNumber
        )?.uintValue
        let animationCurve = UIView.AnimationOptions(
            rawValue: animationCurveRaw ?? UIView.AnimationOptions.curveEaseInOut.rawValue
        )
        
        let intersection = endFrame.intersection(viewToTrack.frame)
        let offset = intersection.height == 0 ?
        0 : intersection.height + DesignConfiguration.keyboardInsetToControlElements
        viewToTrack.transform = CGAffineTransform(translationX: 0, y: -offset)
        
        UIView.animate(
            withDuration: duration ?? 0,
            delay: 0,
            options: animationCurve,
            animations: {
                contentView.layoutIfNeeded()
            },
            completion: nil
        )
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
}
