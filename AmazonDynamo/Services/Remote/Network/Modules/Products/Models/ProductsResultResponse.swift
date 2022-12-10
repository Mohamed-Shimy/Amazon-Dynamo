//
//  ProductsResultResponse.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import Foundation

struct ProductsResultResponse: Codable {
    
    let results: [ProductResponse]?
}
