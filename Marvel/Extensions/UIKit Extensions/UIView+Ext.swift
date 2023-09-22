//
//  UIView+Ext.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import UIKit

extension UIView {
    
    func fadeAnimation(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, options: UIView.AnimationOptions = [.curveLinear, .allowUserInteraction], animationCompletion: @escaping (() -> Void) = ({() -> Void in }), completion: ((Bool) -> Void)? = nil ) {
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
            animationCompletion()
        }, completion: completion)
    }
    
}
