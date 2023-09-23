//
//  SectionWithUniqueCell.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 23/09/2023.
//

import Foundation

class SectionWithUniqueCell: SectionItem, SectionWithUniqueCellProtocol {
    
    var cellIdentifier: String?
    var rowHeight: CGFloat?
    var rowWidth: CGFloat?
    var data: [Any]?
    
    init(_ sectionHeader: SectionBorder? = nil, sectionFooter: SectionBorder? = nil, expandSection: Bool = true, cellIdentifier: String? = nil, rowHeight: CGFloat? = nil, rowWidth: CGFloat? = nil, data: [Any]? = nil) {
        super.init(sectionHeader, sectionFooter: sectionFooter, expandSection: expandSection)
        self.data = data
        self.cellIdentifier = cellIdentifier
        self.rowHeight = rowHeight
        self.rowWidth = rowWidth
    }
    
    override var numberOfRowsPerSection: Int {
        guard let dataSafe = data, !dataSafe.isEmpty else {
            return 0
        }
        return !expandSection ? 1 : dataSafe.count
    }
    
    override var rowDatas: [Any]? {
        return data
    }
    
    override func rowCellIdentifier(_ row: Int) -> String? {
        return cellIdentifier
    }
    
    override func rowHeight(_ row: Int) -> CGFloat? {
        return rowHeight
    }
    
    override func rowWidth(_ row: Int) -> CGFloat? {
        return rowWidth
    }
    
    override func rowItem(_ row: Int) -> Any? {
        guard let datasSafe = data, !datasSafe.isEmpty else {
            return nil
        }
        
        return datasSafe[row]
    }
    
    func removeRowAtIndex(_ row: Int) {
        data?.remove(at: row)
    }
    
    func addRow(_ row: Int = NSNotFound, item: Any) {
        if row == NSNotFound {
            data?.append(item)
        } else {
            data?.insert(item, at: row)
        }
    }
    
    func updateRowAtIndex(_ row: Int, newItem: Any) {
        data?[row] = newItem
    }
    
    func updateRowHeight(_ row: Int, height: CGFloat) {
        rowHeight = height
    }
    
    func updateRowWidth(_ row: Int, width: CGFloat) {
        if let _ = rowWidth {
            rowWidth = width
        }
    }
    
    func removeRowsAtIndexes(_ rows: [Int]) {
        self.data?.remove(atOffsets: IndexSet(rows))
    }
    
    func findRowIndex(_ completionHandler: (Any) -> Bool) -> Int {
        return data?.firstIndex(where: completionHandler) ?? NSNotFound
    }
    
}
