//
//  Model.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 20/09/2023.
//

import Foundation

class Model: NSObject {
    
    private var constructHash: (timestamp: String, hash: String) {
        let timestampString = String(Int(Date().timeIntervalSince1970))
        let stringToBeHashed = timestampString + Constants.privateAPIKey + Constants.publicAPIKey
        return (timestampString, Crypto.getMD5Hash(for: stringToBeHashed))
    }
    
    func fetchCharacters() async throws -> Any {
        let constructedHash = constructHash
        
        //Create URL
        let url = URL(string: "https://gateway.marvel.com/v1/public/characters?apikey=\(Constants.publicAPIKey)&ts=\(constructedHash.timestamp)&hash=\(constructedHash.hash)")
        
        //create a new urlRequest passing the url
        let request = URLRequest(url: url!)
        
        //run the request and retrieve both the data and the response of the call
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return data
        } catch {
            throw error
        }
        
        
        //checks if there are errors regarding the HTTP status code and decodes using the passed struct
//        let fetchedData = try JSONDecoder().decode(Products.self, from: try mapResponse(response: (data,response)))
        
        
    }
    
}
