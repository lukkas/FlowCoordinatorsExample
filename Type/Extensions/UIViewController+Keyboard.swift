//
//  UIViewController+Keyboard.swift
//  Type
//
//  Created by Łukasz Kasperek on 21.08.2016.
//  Copyright © 2016 Lukasz Kasperek. All rights reserved.
//

import UIKit

private var constraintKey : UInt8 = 0

extension UIViewController {
    
    public func setupKeyboardNotifcationListenerForBottomLayoutGuideConstraint(constraint: NSLayoutConstraint) {
        NotificationCenter.default.addObserver(self, selector: #selector(handleKyboardWillShowByModifyingBottomLayoutGuideConstraint(notification:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleKeyboardWillHideByModifyingBottomLayoutGuideConstraint(notification:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
        bottomLayoutGuideConstraint = constraint
    }
    
    public func removeKeyboardNotificationListeners() {
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.removeObserver(self, name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    private var bottomLayoutGuideConstraint: NSLayoutConstraint! {
        get {
            return objc_getAssociatedObject(self, &constraintKey) as? NSLayoutConstraint
        }
        set(newValue) {
            objc_setAssociatedObject(self, &constraintKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    func handleKyboardWillShowByModifyingBottomLayoutGuideConstraint(notification: NSNotification) {
        let userInfo = notification.userInfo!
        let animationDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        let animationCurve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! Int
        let keyboardFrame = userInfo[UIKeyboardFrameEndUserInfoKey] as! CGRect
        let keyboardFrameConvertedToViewFrame = view.convert(keyboardFrame, from: nil)
        let options = UIViewAnimationOptions(rawValue: UInt(animationCurve) | UIViewAnimationOptions.beginFromCurrentState.rawValue)
        bottomLayoutGuideConstraint.constant = keyboardFrameConvertedToViewFrame.height
        
        UIView.animate(withDuration: animationDuration, delay: 0, options:options, animations: { () -> Void in
            self.view.layoutIfNeeded()
        }) { (complete) -> Void in
        }
    }
    
    func handleKeyboardWillHideByModifyingBottomLayoutGuideConstraint(notification: NSNotification) {
        let userInfo = notification.userInfo!
        let animationDuration = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        let animationCurve = userInfo[UIKeyboardAnimationCurveUserInfoKey] as! Int
        let options = UIViewAnimationOptions(rawValue: UInt(animationCurve) | UIViewAnimationOptions.beginFromCurrentState.rawValue)
        bottomLayoutGuideConstraint.constant = 0
        
        UIView.animate(withDuration: animationDuration, delay: 0, options:options, animations: { () -> Void in
            self.view.layoutIfNeeded()
        }) { (complete) -> Void in
        }
    }
}
