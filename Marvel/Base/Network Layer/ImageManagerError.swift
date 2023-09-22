//
//  ImageManagerError.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 21/09/2023.
//

import Foundation

enum ImageManagerError: Error {
    
    case requestError(statusCode: Int)
    case failed(reason: String?)
    case internetConnection
    case requestCanceled
    case urlNotFound
    case unknown
    
}
