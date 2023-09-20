//
//  Crypto.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 20/09/2023.
//

import Foundation
import CommonCrypto

class Crypto {
    
    static func getMD5Hash(for string: String) -> String {
        guard let data = string.data(using: .utf8) else { return "" }
        var digest = [UInt8](repeating: 0, count: Int(CC_MD5_DIGEST_LENGTH))
        
        _ = data.withUnsafeBytes {
            CC_MD5($0.baseAddress, CC_LONG(data.count), &digest)
        }
        
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
    
}
