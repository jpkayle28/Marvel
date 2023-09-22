//
//  Constants+APIEndpoint.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 20/09/2023.
//

import Foundation

extension Constants {
    
    enum APIEndpoint {
        
        case characters
        case character(characterID: Int)
        case comics(characterID: Int)
        case events(characterID: Int)
        case series(characterID: Int)
        case stories(characterID: Int)
        
        private var baseURL: String {
            "https://gateway.marvel.com/v1/public/"
        }
        
        private var endPointRawValue: String {
            let description = String(describing: self).components(separatedBy: "(")
            return description.first ?? ""
        }
        
        var fullPath: String {
            var endpoint: String
            switch self {
                case .characters:
                    endpoint = String(describing: self)
                case .character(let characterID),
                        .comics(let characterID),
                        .events(let characterID),
                        .series(let characterID),
                        .stories(let characterID):
                    endpoint = "\(String(describing: Self.characters))/\(characterID)/\(endPointRawValue)"
            }
            return baseURL + endpoint
        }
        
        var limit: String? {
            switch self {
                case .characters: return nil
                default: return "3"
            }
        }
    }
    
}
