//
//  CharactersResponse.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 21/09/2023.
//

import Foundation

struct MarvelCharacter: Decodable {
    
    var id: Int?
    var name: String?
    var description: String?
    var thumbnail: Thumbnail?
    
}

struct Thumbnail: Decodable {
    
    var path: String?
    var `extension`: String?
    
    var imageURL: String? {
        guard let path, let `extension` else { return nil }
        return path + "." + `extension`
    }
    
}
