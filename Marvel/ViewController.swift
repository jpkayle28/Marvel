//
//  ViewController.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 19/09/2023.
//

import UIKit

class ViewController: UIViewController {

    lazy var charactersViewModel: CharactersViewModel = {
        let viewModel = CharactersViewModel()
        viewModel.successObserver.addObserver { [weak self] _ in
            print(viewModel.items)
        }
        return viewModel
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        charactersViewModel.request()
    }


}

