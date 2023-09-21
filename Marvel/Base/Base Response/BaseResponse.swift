//
//  BaseResponse.swift
//  Marvel
//
//  Created by Jean-Pierre Kayle on 21/09/2023.
//

import Foundation

struct BaseResponse<DataItem>: Decodable where DataItem: Decodable {
    let code: Int?
    let status: String?
    let data: DataItem?
}

struct DataContainer<Item>: Decodable where Item: Decodable {
    let results: [Item]?
    let offset, count, total, limit: Int?
}
