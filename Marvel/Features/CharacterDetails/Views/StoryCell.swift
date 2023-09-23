//
//  StoryCell.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 23/09/2023.
//

import UIKit

class StoryCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    
    // MARK: - Data Property
    private var data: Story? {
        didSet {
            fillData()
        }
    }
    
    // MARK: - Configuration
    
    func fillData() {
        guard let item = data else { return }
        nameLabel.text = item.title
    }
}

// MARK: - Data Setup
extension StoryCell: BaseLayoutFromDataProtocol {
    
    func updateLayoutFromData(_ data: Any?) {
        if let data = data as? Story {
            self.data = data
        }
    }
    
}
