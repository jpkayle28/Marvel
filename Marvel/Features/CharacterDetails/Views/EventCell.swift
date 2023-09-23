//
//  EventCell.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 23/09/2023.
//

import UIKit

class EventCell: ImageTableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var topConstraint: NSLayoutConstraint?
    @IBOutlet weak var centerConstraint: NSLayoutConstraint?
    
    // MARK: - Data Property
    private var data: CharacterDetailObject? {
        didSet {
            fillData()
        }
    }
    
    // MARK: - Configuration
    
    func fillData() {
        guard let item = data else { return }
        imageV.load(with: item.thumbnail?.imageURL)
        nameLabel.text = item.title
        descriptionLabel.text = item.description
        descriptionLabel.isHidden = descriptionLabel.text?.isEmpty ?? true
        topConstraint?.isActive = !descriptionLabel.isHidden
        centerConstraint?.isActive = descriptionLabel.isHidden
    }
    
}

// MARK: - Data Setup
extension EventCell: BaseLayoutFromDataProtocol {
    
    func updateLayoutFromData(_ data: Any?) {
        if let data = data as? CharacterDetailObject {
            self.data = data
        }
    }
    
}
