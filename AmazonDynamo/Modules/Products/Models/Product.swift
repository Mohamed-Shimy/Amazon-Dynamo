//
//  Product.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import Foundation

struct Product: Identifiable {
    
    let id: String
    let name: String
    let createdAt: String
    let price: String
    let imageIds: [String]
    let imageURLs: [String]
    let imageURLsThumbnails: [String]
}

extension Product {
    
    init?(_ response: ProductResponse) {
        guard let id = response.uid else { return nil }
        self.init(id: id,
                  name: response.name ?? "",
                  createdAt: response.createdAt ?? "",
                  price: response.price ?? "",
                  imageIds: response.imageIds ?? [],
                  imageURLs: response.imageURLs ?? [],
                  imageURLsThumbnails: response.imageURLsThumbnails ?? [])
    }
}
