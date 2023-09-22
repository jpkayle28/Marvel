//
//  SeriesViewModel.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import Foundation

class SeriesViewModel: BaseViewModel<Serie> {
    
    var character: MarvelCharacter?
    
    override func request() {
        guard let id = character?.id else { return }
        sendRequest(.series(characterID: id))
    }
    
}
