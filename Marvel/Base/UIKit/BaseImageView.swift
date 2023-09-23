//
//  BaseImageView.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import UIKit

class BaseImageView: UIImageView {
    
    // MARK: - Image Loading
    
    private var task: Task<UIImage, Error>?

    func load(with url: String?, _ cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) {
        guard let url else { return }
        Task {
            do {
                task = try ImageManager.fetchImage(with: url, cachePolicy: cachePolicy)
                showLoader()
                let image = try await task?.value
                DispatchQueue.main.async { [weak self] in
                    self?.hideLoader()
                    self?.image = image
                }
            } catch let error {
                throw error
            }
        }
    }
    
    func cancelTask() {
        task?.cancel()
        task = nil
    }
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLoader()
    }
    
    // MARK: - Loader
    
    lazy var loader = LoaderOverlayView(frame: self.frame)
    
    private func setupLoader() {
        loader.style = .medium
        loader.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(loader)
        
        // Set loader constraints to cover the entire view
        NSLayoutConstraint.activate([
            loader.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            loader.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            loader.topAnchor.constraint(equalTo: self.topAnchor),
            loader.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        loader.isHidden = true
    }
    
    func showLoader() {
        DispatchQueue.main.async { [weak self] in
            self?.loader.startAnimating()
        }
    }
    
    func hideLoader() {
        loader.stopAnimating()
    }
}
