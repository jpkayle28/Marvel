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
    
    static var typeName: String {
        return String(describing: self)
    }
    
    var typeName: String {
        let thisType = type(of: self)
        return String(describing: thisType)
    }
    
}
