//
//  CharactersListingViewModel.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import Foundation

class CharactersListingViewModel: SectionListingViewModel {
    
    override var cellIdentifiers: [String]? {
        ["CharactersCell"]
    }
    
//    override func updateUIFromDataAtIndexPath(_ indexPath: IndexPath) -> Any? {
//        return genericItemAtIndexPath(indexPath)
//    }
    
}

extension CharactersListingViewModel: ListingDataSourceProtocolGeneric {
    
    typealias GenericType = MarvelCharacter
    
    func genericItemAtIndexPath(_ indexPath: IndexPath) -> MarvelCharacter? {
        guard let itemSafe = self.itemAtIndexPath(indexPath) as? MarvelCharacter else {
            return nil
        }
        
        return itemSafe
    }
    
}
