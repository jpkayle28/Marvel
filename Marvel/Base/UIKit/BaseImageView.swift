//
//  BaseImageView.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import UIKit

class BaseImageView: UIImageView {
    
    // MARK: - Inspectables
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
    
    // MARK: - Image Loading
    
    private var task: Task<UIImage, Error>?

    func load(with url: String?, _ cachePolicy: URLRequest.CachePolicy = .useProtocolCachePolicy) {
        guard let url else { return }
        Task {
            do {
                task = try ImageManager.fetchImage(with: url, cachePolicy: cachePolicy)
                let image = try await task?.value
                DispatchQueue.main.async { [weak self] in
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
}
