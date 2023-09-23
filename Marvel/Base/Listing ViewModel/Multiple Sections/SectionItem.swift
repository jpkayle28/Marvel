//
//  SectionItem.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 23/09/2023.
//

import Foundation

class SectionItem: BaseSectionInputProtocol {    
    
    var sectionHeader: SectionBorder?
    var sectionFooter: SectionBorder?
    var expandSection: Bool
    
    init(_ sectionHeader: SectionBorder? = nil, sectionFooter: SectionBorder? = nil, expandSection: Bool = true) {
        self.sectionHeader = sectionHeader
        self.sectionFooter  = sectionFooter
        self.expandSection = expandSection
    }
    
    var numberOfRowsPerSection: Int {
        return 0
    }
    
    var rowDatas: [Any]? {
        return nil
    }
    
    func rowCellIdentifier(_ row: Int) -> String? {
        return nil
    }
    
    func rowHeight(_ row: Int) -> CGFloat? {
        return nil
    }
    
    func rowItem(_ row: Int) -> Any? {
        return nil
    }
    
    func rowWidth(_ row: Int) -> CGFloat? {
        return nil
    }
}
