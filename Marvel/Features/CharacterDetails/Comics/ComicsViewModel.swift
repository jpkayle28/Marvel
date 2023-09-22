//
//  ComicsViewModel.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import Foundation

class ComicsViewModel: BaseViewModel<Comic> {
    
    var character: MarvelCharacter?
    
    override func request() {
        guard let id = character?.id else { return }
        sendRequest(.comics(characterID: id))
    }
    
}
