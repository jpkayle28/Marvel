//
//  CharactersRouter.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import Foundation

extension Router {
    
    static var charactersVC: CharactersViewController {
        return CharactersViewController.instantiate(storyboard: mainStoryboard)
    }
    
}
