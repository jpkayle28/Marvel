//
//  CharacterCell.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 23/09/2023.
//

import UIKit

class CharacterCell: CharactersCell {
    
    
}

extension CharacterCell {
    
    override func setupData(_ data: Any?) { }
    
}

extension CharacterCell: BaseLayoutFromDataProtocol {
    
    func updateLayoutFromData(_ data: Any?) {
        super.setupData(data)
    }
    
}
