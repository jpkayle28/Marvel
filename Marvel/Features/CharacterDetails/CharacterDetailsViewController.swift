//
//  CharacterDetailsViewController.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import UIKit

class CharacterDetailsViewController: BaseListingViewController {
    
    // MARK: - Injected Property
    
    var character: MarvelCharacter!
    
    // MARK: - ViewModels
    
    lazy var comicsViewModel: ComicsViewModel = { [weak self] in
        let viewModel = ComicsViewModel()
        viewModel.character = self?.character
        viewModel.responseObserver.addObserver { [weak self] result in
            print(result)
            self?.dispatchGroup.leave()
        }
        return viewModel
    }()
    
    lazy var eventsViewModel: EventsViewModel = { [weak self] in
        let viewModel = EventsViewModel()
        viewModel.character = self?.character
        viewModel.responseObserver.addObserver { [weak self] result in
            print(result)
            self?.dispatchGroup.leave()
        }
        return viewModel
    }()
    
    lazy var seriesViewModel: SeriesViewModel = { [weak self] in
        let viewModel = SeriesViewModel()
        viewModel.character = self?.character
        viewModel.responseObserver.addObserver { [weak self] result in
            print(result)
            self?.dispatchGroup.leave()
        }
        return viewModel
    }()
    
    lazy var storiesViewModel: StoriesViewModel = { [weak self] in
        let viewModel = StoriesViewModel()
        viewModel.character = self?.character
        viewModel.responseObserver.addObserver { [weak self] result in
            print(result)
            self?.dispatchGroup.leave()
        }
        return viewModel
    }()
    
    // MARK: - Properties
    
    let dispatchGroup = DispatchGroup()
    
    // MARK: - Listing ViewModel
    
    var characterDetailsListingViewModel: CharacterDetailsListingViewModel?
    override var GenericListingViewModelType: ListingViewModel.Type {
        return CharacterDetailsListingViewModel.self
    }
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        characterDetailsListingViewModel = getCurrentGenericListingViewModel(CharacterDetailsListingViewModel.self)
        
        callViewModels()
    }
    
    func callViewModels() {
        showLoader()
        dispatchGroup.enter()
        comicsViewModel.request()
        dispatchGroup.enter()
        eventsViewModel.request()
        dispatchGroup.enter()
        seriesViewModel.request()
        dispatchGroup.enter()
        storiesViewModel.request()
        
        dispatchGroup.notify(queue: .main) { [weak self] in
            guard let self else { return }
            self.hideLoader()
            self.characterDetailsListingViewModel?.item = (self.character, self.comicsViewModel.items, self.eventsViewModel.items)
            self.reloadTableViewData()
        }
    }
}
