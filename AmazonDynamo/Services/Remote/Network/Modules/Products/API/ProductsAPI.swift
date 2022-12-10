//
//  ProductsAPI.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import Foundation
import Moya

enum ProductsAPI {
    
    case products
}

extension ProductsAPI: TargetType {
    
    var baseURL: URL {
        URL(string: "https://ey3f2y0nre.execute-api.us-east-1.amazonaws.com/")!
    }
    
    var path: String {
        switch self {
            case .products: return "default/dynamodb-writer"
        }
    }
    
    var method: Moya.Method {
        switch self {
            case .products: return .get
        }
    }
    
    var headers: [String : String]? {
        ["Content-Type": "application/json"]
    }
    
    var task: Task {
        switch self {
            case .products: return .requestPlain
        }
    }
}
