//
//  SectionBorder.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import UIKit

/// Section Header or Footer
class SectionBorder {
    
    let sectionBorderIdentifier: String
    let height: CGFloat
    let sectionBorderTintColor: UIColor
    var data: Any?
    var width: CGFloat?
    var uiItem: Any?
    
    init(_ sectionIdentifier: String, height: CGFloat, width: CGFloat? = nil, sectionBorderTintColor: UIColor = UIColor.white, data: Any? = nil, uiItem: Any? = nil) {
        self.sectionBorderIdentifier = sectionIdentifier
        self.height = height
        self.width = width
        self.sectionBorderTintColor = sectionBorderTintColor
        self.data = data
        self.uiItem = uiItem
    }
}
