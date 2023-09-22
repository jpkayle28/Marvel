//
//  ListingProtocols.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import Foundation

protocol ListingExtrasProtocols {
    
    func setupComponents()
}

protocol MainListingProtocol {
    
    var numberOfSections: Int { get }
    var actionHandler: ((IndexPath?) -> Void)? { get set }
    
    func cellIdentifierIndexPath(_ indexPath: IndexPath) -> String?
    func numberOfRowsPerSection(_ section: Int) -> Int
    func itemAtIndexPath(_ indexPath: IndexPath) -> Any?
    func updateUIFromDataAtIndexPath(_ indexPath: IndexPath) -> Any?
}

protocol BaseSectionInputProtocol {
    
    var numberOfRowsPerSection: Int { get }
    var sectionHeader: SectionBorder? { get set }
    var footerHeader: SectionBorder? { get set }
    var expandSection: Bool { get set }
    var rowDatas: [Any]? { get }
    
    func rowCellIdentifier(_ row: Int) -> String?
    func rowHeight(_ row: Int) -> CGFloat?
    func rowWidth(_ row: Int) -> CGFloat?
    func rowItem(_ row: Int) -> Any?
}

///  TableView

protocol TableViewListingProtocol: MainListingProtocol {
    
    func rowHeightIndex(_ indexPath: IndexPath) -> CGFloat
}

// MARK: - Listing Protocols

protocol ListingDataSourceProtocol: MainListingProtocol {
    
    func setupItems(_ items: [Any]?)
    func removeAllItems()
    
}
//// Single Listing Data Source Protocol

protocol SingleListingDataSourceProtocol: ListingDataSourceProtocol {
    
    var items: [Any] { get set }
    
}

//// Sections Listing Data Source Protocol

protocol SectionsListingDataSourceProtocol: ListingDataSourceProtocol {
    
    var sections: [BaseSectionInputProtocol] { get set }
}

/// Sections And Footers

protocol MainListingWithSectionHeader {
    
    func sectionHeaderAtSection(_ section: Int) -> SectionBorder?
    
}

protocol MainListingWithSectionFooter {
    
    func sectionFooterAtSection(_ section: Int) -> SectionBorder?
    
}

/// Section Implement Methods

protocol SectionExtrasMethodsProtocol {
    
    func removeRowAtIndex(_ row: Int)
    func removeRowsAtIndexes(_ rows: [Int])
    func updateRowAtIndex(_ row: Int, newItem: Any)
    func updateRowHeight(_ row: Int, height: CGFloat)
    func updateRowWidth(_ row: Int, width: CGFloat)
    func addRow(_ row: Int, item: Any)
    func findRowIndex(_ completionHandler: (Any) -> Bool) -> Int
}

protocol SectionMultipleCellsExtraMethodsProtocol: SectionExtrasMethodsProtocol {
    
    func updateRowItemDataAtIndex(_ row: Int, newData: Any?)
}

/// Listing View Model

protocol ListingDataSourceProtocolGeneric {
    
    associatedtype GenericType
    
    func genericItemAtIndexPath(_ indexPath: IndexPath) -> GenericType?
}
