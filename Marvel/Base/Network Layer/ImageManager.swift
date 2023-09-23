//
//  ImageManager.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 21/09/2023.
//

import UIKit

struct ImageManager {
    
    static func fetchImage(with urlString: String, 
                           priority: TaskPriority = .high,
                           cachePolicy: URLRequest.CachePolicy = .reloadIgnoringLocalAndRemoteCacheData,
                           storageFolderName: String? = nil,
                           storageFileName: String? = nil,
                           storageFileExtension: String? = nil) throws -> Task<UIImage, Error>? {
        
        let imageTask = Task<UIImage, Error>(priority: priority) {
            
            let url = URL(string: urlString)
            guard let urlSafe = url else {
                throw ImageManagerError.urlNotFound
            }
            
            let urlRequest = URLRequest(url: urlSafe, cachePolicy: cachePolicy)
            
            if Task.isCancelled {
                throw ImageManagerError.requestCanceled
            }
            
            let sessionConfiguration = URLSessionConfiguration.default
            let session = URLSession(configuration: sessionConfiguration)
            guard !Task.isCancelled else {
                throw ImageManagerError.requestCanceled
            }
            
            var imageData: Data?
            
            let requestResponse = try await session.data(for: urlRequest)
            imageData = requestResponse.0
            
            
            guard !Task.isCancelled else {
                throw ImageManagerError.requestCanceled
            }
            
            guard let imageDataSafe = imageData, let image = UIImage(data: imageDataSafe) else {
                throw ImageManagerError.failed(reason: "Image Not Received")
            }
            do {
                try saveImage(imageDataSafe, folderName: storageFolderName, fileName: storageFileName, fileExtension: storageFileExtension)
            } catch let error {
                print(error)
            }
            return image
        }
        
        guard !imageTask.isCancelled else {
            throw ImageManagerError.requestCanceled
        }
        return imageTask
    }
    
    // MARK: - Unused: Could be used to store images in FileManager
    
    private static func saveImage(_ imageData: Data?, folderName: String? = nil, fileName: String? = nil, fileExtension: String? = nil) throws {
        guard let imageData else {
            throw ImageManagerError.failed(reason: "No Image Data")
        }
        
        guard let folderName, let fileName, let fileExtension, let url = FileAppManager.mediaFileUrl(folderName, fileName: fileName, fileExtension: fileExtension) else { return }
        
        do {
            let _ = try FileAppManager.saveData(imageData, fileUrl: url)
        } catch let error {
            throw error
        }
    }
    
    static func retrieveImageFromCache(folderName: String? = nil, fileName: String, fileExtension: String, priority: TaskPriority = .high) throws -> Task<UIImage, Error>? {
        let imageTask = Task<UIImage, Error>(priority: priority) {
            guard let mediaURL = FileAppManager.mediaFileUrl(folderName, fileName: fileName, fileExtension: fileExtension) else { throw ImageManagerError.failed(reason: "File Not Found") }
            
            do {
                let imageData = FileAppManager.retrieveMediaCache(mediaURL)
                guard let imageDataSafe = imageData, let image = UIImage(data: imageDataSafe) else {
                    throw ImageManagerError.failed(reason: "Image Not Found in cache directory")
                }
                return image
            } catch let error {
                throw error
            }
        }
        return imageTask
    }
    
}
