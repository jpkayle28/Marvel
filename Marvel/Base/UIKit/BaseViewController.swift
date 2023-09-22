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
    
    private let loaderOverlayView = LoaderOverlayView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLoader()
    }
    
    private func setupLoader() {
        loaderOverlayView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(loaderOverlayView)
        
        // Set loader constraints to cover the entire view
        NSLayoutConstraint.activate([
            loaderOverlayView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            loaderOverlayView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            loaderOverlayView.topAnchor.constraint(equalTo: view.topAnchor),
            loaderOverlayView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        loaderOverlayView.isHidden = true
    }
    
    func showLoader() {
        loaderOverlayView.startAnimating()
    }
    
    func hideLoader() {
        loaderOverlayView.stopAnimating()
    }
    
    // Show Alert
    func showAlert(title: String? = nil, message: String? = nil, buttonTitle: String? = "OK", handler: ((UIAlertAction) -> Void)? = nil) {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            alertController.addAction(UIAlertAction(title: buttonTitle, style: .default, handler: handler))
            self.present(alertController, animated: true)
        }
    }
}
