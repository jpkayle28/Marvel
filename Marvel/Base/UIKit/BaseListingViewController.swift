//
//  BaseListingViewController.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import UIKit

protocol BaseGenericListingViewControllerProtocol {
    
    var GenericListingViewModelType: ListingViewModel.Type { get }
    func getCurrentGenericListingViewModel<T: ListingViewModel>(_ type: T.Type) -> T?
}

class BaseListingViewController: BaseViewController, BaseGenericListingViewControllerProtocol {
    
    // MARK: - Outlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - BaseGenericListingViewControllerProtocol
    
    var GenericListingViewModelType: ListingViewModel.Type {
        return ListingViewModel.self
    }
    
    func getCurrentGenericListingViewModel<T>(_ type: T.Type) -> T? where T : ListingViewModel {
        guard let safeViewModel = listingViewModel as? T else { return nil }
        return safeViewModel
    }
    
    lazy var listingViewModel = GenericListingViewModelType.init()
    
    // MARK: - Public Methods
    
    func reloadTableViewData() {
        DispatchQueue.main.async { [weak self] in
            self?.tableView.backgroundView = nil
            if let _ = self?.tableView.delegate {
                self?.tableView.reloadData()
            } else {
                self?.tableView.delegate = self?.listingViewModel
                self?.tableView.dataSource = self?.listingViewModel
            }
        }
        
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        registerHeadersAndFooters()
        setupTableView()
    }
    
    // MARK: - Setup
    
    private func setupTableView() {
        tableView.sectionHeaderTopPadding = 0.0
        tableView.showsVerticalScrollIndicator = false
        reloadTableViewData()
    }
    
    // MARK: - Register Cells
    
    private func registerCells() {
        if let cells = listingViewModel.cellIdentifiers {
            tableView.registerCells(cells)
        }
    }
    
    private func registerHeadersAndFooters() {
        if let headers = listingViewModel.headerIdentifiers {
            tableView.registerMultipleSectionsFooters(headers)
        }
        if let footers = listingViewModel.footerIdentifiers {
            tableView.registerMultipleSectionsFooters(footers)
        }
    }
}
