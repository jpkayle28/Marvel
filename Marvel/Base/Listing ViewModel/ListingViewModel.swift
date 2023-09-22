//
//  ListingViewModel.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import Foundation

class ListingViewModel: NSObject {
    
    var actionHandler: ((IndexPath?) -> Void)?
    
    var cellIdentifiers: [String]? {
        return nil
    }
    
    var headerIdentifiers: [String]? {
        return nil
    }
    
    var footerIdentifiers: [String]? {
        return nil
    }
    
    required override init() {
        super.init()
        setup()
    }
    
    private func setup() {
        if let service = self as? ListingExtrasProtocols {
            service.setupComponents()
        }
    }
    
    func cellIdentifierIndexPath(_ indexPath: IndexPath) -> String? {
        return nil
    }
    
    func itemAtIndexPath(_ indexPath: IndexPath) -> Any? {
        return nil
    }
    
    func updateUIFromDataAtIndexPath(_ indexPath: IndexPath) -> Any? {
        return nil
    }
    
    func numberOfRowsPerSection(_ section: Int) -> Int {
        return 0
    }
    
    var numberOfSections: Int {
        return 0
    }
    
    var selectionCellAnimation: Bool {
        return true
    }
    
}

//// TableViewListingProtocol

@objc extension ListingViewModel: TableViewListingProtocol {
    
    func rowHeightIndex(_ indexPath: IndexPath) -> CGFloat {
        return 0.0
    }
}

/// Data Modifications

@objc extension ListingViewModel {
    
    func removeRowAtIndexPath(_ indexPath: IndexPath) {
        if var service = self as? SingleListingDataSourceProtocol {
            service.items.remove(at: indexPath.row)
        }
    }
    
    func updateRowItemDataAtIndex(_ indexPath: IndexPath, newData: Any?) {
        if var service = self as? SingleListingDataSourceProtocol, let dataSafe = newData {
            service.items[indexPath.row] = dataSafe
        }
    }
}
