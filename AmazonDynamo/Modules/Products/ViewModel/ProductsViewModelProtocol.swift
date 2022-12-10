//
//  ProductsViewModelProtocol.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import Foundation
import Combine

protocol ProductsViewModelProtocol: ObservableObject {
    
    var products: [Product] { get }
    var isLoading: Bool { get }
    var error: NetworkError? { get set }
    
    func loadProducts()
}
