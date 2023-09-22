//
//  SectionListingViewModel.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import UIKit

class SectionListingViewModel: ListingViewModel, SingleListingDataSourceProtocol {
    
    lazy var items = [Any]()
    
    func setupItems(_ items: [Any]? = nil ) {
        if let itemsSafe = items, !itemsSafe.isEmpty {
            self.items.append(contentsOf: itemsSafe)
        }
    }
    
    func removeAllItems() {
        items.removeAll()
    }
    
    override var numberOfSections: Int {
        return 1
    }
    
    override func numberOfRowsPerSection(_ section: Int) -> Int {
        return items.count
    }
    
    override func cellIdentifierIndexPath(_ indexPath: IndexPath) -> String? {
        return cellIdentifiers?.first
    }
    
    override func rowHeightIndex(_ indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    override func itemAtIndexPath(_ indexPath: IndexPath) -> Any? {
        guard items.isEmpty == false, indexPath.row <= items.count - 1 else {
            return nil
        }
        return items[indexPath.row]
    }
}

