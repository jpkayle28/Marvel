//
//  ImageTableViewCell.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import UIKit

class ImageTableViewCell: UITableViewCell {
    
    @IBOutlet weak var imageV: BaseImageView!
    
    // MARK: - Lifecycle
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        
        cancelRequest()
    }
    
    deinit {
        cancelRequest()
    }
    
    private func cancelRequest() {
        imageV.cancelTask()
    }
    
}
