//
//  CharacterDetailsRouter.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import Foundation

extension Router {
    
    static func characterDetailsVC(_ character: MarvelCharacter) -> CharacterDetailsViewController {
        let vc = CharacterDetailsViewController.instantiate(storyboard: mainStoryboard)
        vc.character = character
        return vc
    }
    
}
