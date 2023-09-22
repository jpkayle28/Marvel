//
//  Event.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import Foundation

struct Event: Decodable {
    
    var id: Int?
    var title, description: String?
    var thumbnail: Thumbnail?
    
}
