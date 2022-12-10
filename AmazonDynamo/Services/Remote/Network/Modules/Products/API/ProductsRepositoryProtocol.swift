//
//  ProductsRepositoryProtocol.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import Foundation
import Combine

protocol ProductsRepositoryProtocol: AnyObject {
    
    func getProducts() -> AnyPublisher<ProductsResultResponse, Error>
}
