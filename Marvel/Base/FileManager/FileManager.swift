//
//  FileManager.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 21/09/2023.
//

import Foundation

class FileAppManager {
    
    class var cachePath: String {
        let array = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
        guard array.count > 0, let path = array.first  else {
            return ""
        }
        return path
    }
    
    class public func mediaFileUrl(_ folder: String? = nil, fileName: String, fileExtension: String) -> URL? {
        var path = self.cachePath
        if let isFolder = folder {
            path = path.appendingFormat("/%@", isFolder)
            if !FileManager.default.fileExists(atPath: path) {
                do {
                    _ = try FileManager.default.createDirectory(atPath: path, withIntermediateDirectories: true, attributes: nil)
                } catch {
                    return nil
                }
            }
        }
        path = path.appendingFormat("/%@.%@", fileName, fileExtension)
        let pathUrl = URL(fileURLWithPath: path)
        return pathUrl
    }
    
    class public func storeBase64Media(_ media: String, fileUrl: URL) -> Data? {
        let convertedData = Data(base64Encoded: media, options: .ignoreUnknownCharacters)
        do {
            let data = try saveData(convertedData, fileUrl: fileUrl)
            return data
        } catch {
            return nil
        }
    }
    
    class public func saveData(_ mediaData: Data?, fileUrl: URL) throws -> Data? {
        guard let mediaDataSave = mediaData else {
            return nil
        }
        _ = try mediaDataSave.write(to: fileUrl, options: .atomic)
        return mediaDataSave
    }
    
    class public func retrieveMediaCache(_ fileUrl: URL) -> Data? {
        do {
            let data = try Data(contentsOf: fileUrl)
            return data
            
        } catch {
            return nil
        }
    }
    
    @discardableResult
    class public func removeMedia(_ fileUrl: URL?) -> Bool {
        guard let fileUrlString = fileUrl?.path else {
            return false
        }
        do {
            try FileManager.default.removeItem(atPath: fileUrlString)
            return true
        } catch {
            return false
        }
    }
    
    static public func resetClassIfNeeded(currentClass: AnyObject.Type, oldClassName: String) {
        guard let targetName = Constants.bundleName, !targetName.isEmpty else { return }
        let fullOldClassName = targetName + "." + oldClassName
        guard !NSObject.validClass(_className: fullOldClassName) else {
            return
        }
        NSKeyedUnarchiver.setClass(currentClass, forClassName: fullOldClassName)
    }
}
