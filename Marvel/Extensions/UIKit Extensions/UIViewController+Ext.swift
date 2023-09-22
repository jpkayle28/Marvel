//
//  UIViewController+Ext.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import UIKit

extension UIViewController {
    
    // MARK: - Router
    class func instantiate(storyboard: UIStoryboard, identifier: String? = nil) -> Self {
        return instantiateViewController(type: self, storyboard: storyboard, identifier: identifier ?? typeName)
    }
    
    class func instantiateViewController<T: UIViewController>(type: T.Type, storyboard: UIStoryboard, identifier: String) -> T {
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
    
}
