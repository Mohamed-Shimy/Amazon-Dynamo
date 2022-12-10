//
//  ProductResponse.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import Foundation

struct ProductResponse: Codable {
    
    let createdAt, price, name, uid: String?
    let imageIds, imageURLs, imageURLsThumbnails: [String]?
    
    enum CodingKeys: String, CodingKey {
        case price, name, uid
        case createdAt = "created_at"
        case imageIds = "image_ids"
        case imageURLs = "image_urls"
        case imageURLsThumbnails = "image_urls_thumbnails"
    }
}
