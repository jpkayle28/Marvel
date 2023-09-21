//
//  CharactersViewModel.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 21/09/2023.
//

import Foundation

class CharactersViewModel: BaseViewModel<Characters> {
    
    override func request() {
        super.request()
        sendRequest(.characters)
    }
    
}
