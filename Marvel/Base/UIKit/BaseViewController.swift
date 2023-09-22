//
//  BaseViewController.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import UIKit

class BaseViewController: UIViewController {
    
    lazy var loaderObserver: Observation<Bool> = {
        let loader = Observation<Bool>()
        loader.addObserver { [weak self] value in
            if value ?? false {
                self?.showLoader()
            } else {
                self?.hideLoader()
            }
        }
        return loader
    }()
    
    func showLoader() {
        
    }
    
    func hideLoader() {
        
    }
    
}
