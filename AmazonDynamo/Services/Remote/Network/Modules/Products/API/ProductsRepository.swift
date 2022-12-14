//
//  ProductsRepository.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import Foundation
import Combine

class ProductsRepository: NetworkManager<ProductsAPI>, ProductsRepositoryProtocol {
    
    func getProducts() -> AnyPublisher<ProductsResultResponse, Error> {
        request(.products)
    }
}
