//
//  NSObject+Ext.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 21/09/2023.
//

import Foundation

extension NSObject {
    
    static func validClass(_className: String) -> Bool {
        return NSClassFromString(_className) != nil
    }
    
}
