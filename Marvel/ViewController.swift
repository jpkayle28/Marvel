//
//  ViewController.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 19/09/2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Outlets
    
    @IBOutlet weak var imageView: BaseImageView!

    lazy var charactersViewModel: CharactersViewModel = {
        let viewModel = CharactersViewModel()
        viewModel.successObserver.addObserver { [weak self] _ in
            self?.loadImageWith(thumbnail: viewModel.items?.first?.thumbnail)
        }
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersViewModel.request()
    }


    func loadImageWith(thumbnail: Thumbnail?) {
        imageView.load(with: thumbnail?.imageURL)
    }
    
}

