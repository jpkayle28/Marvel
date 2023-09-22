//
//  Constants.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 20/09/2023.
//

import Foundation

class Constants {
    
    static let publicAPIKey = "b67219866fc543858e69c8e012666cde"
    static let privateAPIKey = "4a6fb94507286ed77345e3bf4a5f914a7de4cc56"
    
    static var bundleName: String? {
        guard let targetName = Bundle.main.infoDictionary?["CFBundleName"] as? String else { return nil }
        return targetName
    }
    
}
