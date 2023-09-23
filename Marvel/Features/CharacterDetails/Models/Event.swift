//
//  Event.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import Foundation

protocol CharacterDetailObject: Decodable {
    
    var id: Int? { get set }
    var title: String? { get set }
    var description: String? { get set }
    var thumbnail: Thumbnail? { get set }
    
}

struct Event: CharacterDetailObject {
    
    var id: Int?
    var title: String?
    var description: String?
    var thumbnail: Thumbnail?
    
}
