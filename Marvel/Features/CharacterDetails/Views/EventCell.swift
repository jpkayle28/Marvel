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
    
    // MARK: - Data Property
    private var data: Event? {
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
        descriptionLabel.isHidden = descriptionLabel.text?.isEmpty ?? false
    }
    
}

// MARK: - Data Setup
extension EventCell: BaseLayoutFromDataProtocol {
    
    func updateLayoutFromData(_ data: Any?) {
        if let data = data as? Event {
            self.data = data
        }
    }
    
}
