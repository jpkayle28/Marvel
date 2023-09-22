//
//  CharactersCell.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import UIKit

class CharactersCell: ImageTableViewCell {

    // MARK: - Outlets
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    // MARK: - Data Property
    private var data: MarvelCharacter? {
        didSet {
            fillData()
        }
    }
    
    // MARK: - Configuration
    
    func fillData() {
        guard let item = data else { return }
        imageV.load(with: item.thumbnail?.imageURL)
        nameLabel.text = item.name
        descriptionLabel.text = item.description
        descriptionLabel.isHidden = descriptionLabel.text?.isEmpty ?? false
    }
    
}

// MARK: - Data Setup
extension CharactersCell: BaseDataViewProtocol {
    
    func setupData(_ data: Any?) {
        if let data = data as? MarvelCharacter {
            self.data = data
        }
    }
    
}
