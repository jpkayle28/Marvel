//
//  NetworkClient.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 20/09/2023.
//

import Foundation

class NetworkClient: NSObject {
    
    func sendRequest(_ api: Constants.APIEndpoint) async throws -> Any {
        // Building URL
        let constructedHash = constructHash
        
        // Appending Parameters
        guard var urlComponents = URLComponents(string: api.fullPath) else { throw NetworkError.invalidURL }
        urlComponents.queryItems = [
            URLQueryItem(name: "apikey", value: Constants.publicAPIKey),
            URLQueryItem(name: "ts", value: constructedHash.timestamp),
            URLQueryItem(name: "hash", value: constructedHash.hash)
        ]
        
        // Validating URL
        guard let url = urlComponents.url else { throw NetworkError.invalidURLComponents }
        
        // Creating URL Request
        let request = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return data
        } catch {
            throw error
        }
    }
        
    
    // MARK: - Private Variables
    
    private var constructHash: (timestamp: String, hash: String) {
        let timestampString = String(Int(Date().timeIntervalSince1970))
        let stringToBeHashed = timestampString + Constants.privateAPIKey + Constants.publicAPIKey
        return (timestampString, Crypto.getMD5Hash(for: stringToBeHashed))
    }
    
}
