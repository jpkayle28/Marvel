//
//  UIView+Ext.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import UIKit

extension UIView {
    
    // MARK: - Inspectables
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    // MARK: - Animations
    
    func fadeAnimation(duration: TimeInterval = 0.5, delay: TimeInterval = 0.0, options: UIView.AnimationOptions = [.curveLinear, .allowUserInteraction], animationCompletion: @escaping (() -> Void) = ({() -> Void in }), completion: ((Bool) -> Void)? = nil ) {
        UIView.animate(withDuration: duration, delay: delay, options: options, animations: {
            animationCompletion()
        }, completion: completion)
    }
    
}
