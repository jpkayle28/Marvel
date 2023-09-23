//
//  ComicCell.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 23/09/2023.
//

import UIKit

class ComicCell: ImageTableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Data Property
    private var data: Comic? {
        didSet {
            fillData()
        }
    }
    
    // MARK: - Configuration
    
    func fillData() {
        guard let item = data else { return }
        imageV.load(with: item.thumbnail?.imageURL)
        nameLabel.text = item.title
    }
    
}

// MARK: - Data Setup
extension ComicCell: BaseLayoutFromDataProtocol {
    
    func updateLayoutFromData(_ data: Any?) {
        if let data = data as? Comic {
            self.data = data
        }
    }
    
}
