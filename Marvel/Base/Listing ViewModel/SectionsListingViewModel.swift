//
//  SectionsListingViewModel.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import Foundation

class SectionsListingViewModel: ListingViewModel, SectionsListingDataSourceProtocol, MainListingWithSectionFooter, MainListingWithSectionHeader {
    
    lazy var sections = [BaseSectionInputProtocol]()
    
    override var numberOfSections: Int {
        return sections.count
    }
    
    var sectionsDatas: [Any]? {
        let array =  sections.compactMap { (section) -> [Any]?  in
            return section.rowDatas
        }
        return array.reduce([], +)
    }
    
    func setupItems(_ items: [Any]?) {
        if let itemsSafe = items as? [BaseSectionInputProtocol] {
            sections.append(contentsOf: itemsSafe)
        }
    }
    
    func removeAllItems() {
        sections.removeAll()
    }
    
    override func numberOfRowsPerSection(_ section: Int) -> Int {
        return sections[section].numberOfRowsPerSection
    }
    
    override func cellIdentifierIndexPath(_ indexPath: IndexPath) -> String? {
        return sections[indexPath.section].rowCellIdentifier(indexPath.row)
    }
    
    override func rowHeightIndex(_ indexPath: IndexPath) -> CGFloat {
        return sections[indexPath.section].rowHeight(indexPath.row) ?? 0.0
    }
    
    override func itemAtIndexPath(_ indexPath: IndexPath) -> Any? {
        guard let item = sections[indexPath.section].rowItem(indexPath.row) else {
            return nil
        }
        return item
    }
    
    // MARK: - MainListingWithSectionHeader
    
    func sectionHeaderAtSection(_ section: Int) -> SectionBorder? {
        return sections[section].sectionHeader
    }
    
    // MARK: - MainListingWithFooterHeader
    
    func sectionFooterAtSection(_ section: Int) -> SectionBorder? {
        return sections[section].footerHeader
    }
    
    // MARK: - Expandable
    
    func changeExpandFlagAtSection(_ section: Int) {
        sections[section].expandSection.toggle()
    }
}

extension SectionsListingViewModel {
    
    func addSectionItem(_ sectionItem: BaseSectionInputProtocol) {
        sections.append(sectionItem)
    }
    
    func insertSectionItem(_ sectionItem: BaseSectionInputProtocol, section: Int) {
        sections.insert(sectionItem, at: section)
    }
    
    func removeSectionItemFromSection(_ section: Int) {
        sections.remove(at: section)
    }
    
    override func removeRowAtIndexPath(_ indexPath: IndexPath) {
        if let section = sections[indexPath.section] as? SectionExtrasMethodsProtocol {
            section.removeRowAtIndex(indexPath.row)
        }
    }
    
    func updateSectionAtIndex(_ indexPath: IndexPath, newSection: BaseSectionInputProtocol) {
        sections[indexPath.section] = newSection
    }
    
    func updateRowAtIndexPath(_ indexPath: IndexPath, newRowItem: Any) {
        if let section = sections[indexPath.section] as? SectionExtrasMethodsProtocol {
            section.updateRowAtIndex(indexPath.row, newItem: newRowItem)
        }
    }
    
    func updateRowHeightAtIndexPath(_ indexPath: IndexPath, height: CGFloat) {
        if let section = sections[indexPath.section] as? SectionExtrasMethodsProtocol {
            section.updateRowHeight(indexPath.row, height: height)
        }
    }
    
    func updateRowWidthAtIndexPath(_ indexPath: IndexPath, width: CGFloat) {
        if let section = sections[indexPath.section] as? SectionExtrasMethodsProtocol {
            section.updateRowWidth(indexPath.row, width: width)
        }
    }
    func addRow(_ row: Int = NSNotFound, section: Int, item: Any) {
        if let section = sections[section] as? SectionExtrasMethodsProtocol {
            section.addRow(row, item: item)
        }
    }
    
    override func updateRowItemDataAtIndex(_ indexPath: IndexPath, newData: Any?) {
        if let section = sections[indexPath.section] as? SectionMultipleCellsExtraMethodsProtocol {
            section.updateRowItemDataAtIndex(indexPath.row, newData: newData)
        }
    }
}
