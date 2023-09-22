//
//  CharactersViewController.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 19/09/2023.
//

import UIKit

class CharactersViewController: BaseListingViewController {
    
    // MARK: - Outlets
    
    lazy var charactersViewModel: CharactersViewModel = {
        let viewModel = CharactersViewModel()
        viewModel.successObserver.addObserver { [weak self] _ in
            self?.charactersListViewModel?.setupItems(self?.charactersViewModel.items)
            self?.reloadTableViewData()
        }
        return viewModel
    }()
    
    var charactersListViewModel: CharactersListingViewModel?
    override var GenericListingViewModelType: ListingViewModel.Type {
        return CharactersListingViewModel.self
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        charactersListViewModel = getCurrentGenericListingViewModel(CharactersListingViewModel.self)
        charactersViewModel.request()
    }
    
}

