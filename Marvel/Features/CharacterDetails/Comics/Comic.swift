//
//  Comic.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 22/09/2023.
//

import Foundation

struct Comic: Decodable {
    
    var id: Int?
    var title: String?
    var issueNumber: Int?
    var description: String?
    
    var thumbnail: Thumbnail?
    var images: [Thumbnail]?
    
}
