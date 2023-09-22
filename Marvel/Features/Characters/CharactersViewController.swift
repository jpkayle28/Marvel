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
        let viewModel = CharactersViewModel(loaderObserver)
        viewModel.responseObserver.addObserver { [weak self] result in
            switch result {
                case .success(_):
                    self?.charactersListViewModel?.setupItems(self?.charactersViewModel.items)
                    self?.reloadTableViewData()
                case .failure(let error):
                    self?.showAlert(title: "Error", message: error.localizedDescription)
                case .none: break
            }
            
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
        charactersListViewModel?.actionHandler = { [weak self] indexPath in
            guard let indexPath, let character = self?.charactersListViewModel?.genericItemAtIndexPath(indexPath) else { return }
            self?.navigationController?.pushViewController(Router.characterDetailsVC(character), animated: true)
        }
        charactersViewModel.request()
    }
    
}

