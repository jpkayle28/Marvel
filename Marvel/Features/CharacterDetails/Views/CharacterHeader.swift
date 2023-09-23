//
//  CharacterHeader.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 23/09/2023.
//

import UIKit

class CharacterHeader: UITableViewHeaderFooterView {
    
    @IBOutlet weak var titleLabel: UILabel!
    
}

extension CharacterHeader: BaseDataViewProtocol {
    
    func setupData(_ data: Any?) {
        if let dataSafe = data as? String {
            titleLabel.text = dataSafe
        }
    }
}
