//
//  ListingViewModel+TableViewExtension.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import UIKit

@objc protocol BaseDataViewProtocol {
    
    func setupData(_ data: Any?)
}

protocol BaseDataViewGenericProtocol {
    
    associatedtype objectType
    func setupData(_ data: objectType?)
}

protocol BaseLayoutFromDataProtocol {
    
    func updateLayoutFromData(_ data: Any?)
}


protocol BaseAnyObjectHandler {
    
    func setupDelegate(_ delegate: AnyObject?)
}


extension ListingViewModel: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return numberOfRowsPerSection(section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellIdentifier = cellIdentifierIndexPath(indexPath) else {
            fatalError("Cell is not found")
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        
        if let cellSafe = cell as? BaseAnyObjectHandler {
            cellSafe.setupDelegate(self)
        }
        
        if let cellSafe = cell as? BaseLayoutFromDataProtocol, let item = updateUIFromDataAtIndexPath(indexPath) {
            cellSafe.updateLayoutFromData(item)
        }
        
        if cell.selectionStyle != .none {
            cell.selectionStyle = .none
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeightIndex(indexPath)
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let cellSafe = cell as? BaseDataViewProtocol, let dataSafe = itemAtIndexPath(indexPath) {
            cellSafe.setupData(dataSafe)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath), let actionHandlerSafe = actionHandler else {
            return
        }
        
        guard selectionCellAnimation else {
            return didSelectRowAt(tableView, didSelectRowAt: indexPath, actionHandler: actionHandlerSafe)
        }
        
        cell.fadeAnimation(duration: 0.1) {
            cell.contentView.alpha = 0.3
        } completion: { _ in
            cell.fadeAnimation(duration: 0.2) { [weak self] in
                cell.contentView.alpha = 1.0
                self?.didSelectRowAt(tableView, didSelectRowAt: indexPath, actionHandler: actionHandlerSafe)
                
            }
        }
    }
    
    private func didSelectRowAt(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath, actionHandler: ((IndexPath?) -> Void)) {
        tableView.allowsSelection = false
        actionHandler(indexPath)
        tableView.allowsSelection = true
    }
    
}
