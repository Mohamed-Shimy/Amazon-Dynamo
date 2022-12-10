//
//  ProductsViewModel.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import Foundation
import Combine

final class ProductsViewModel: ProductsViewModelProtocol {
    
    // MARK: - Properties
    // MARK: Public
    @Published private(set) var products: [Product] = []
    @Published private(set) var isLoading: Bool = false
    @Published var error: NetworkError? = nil
    
    // MARK: Private
    private let productsRepository: ProductsRepositoryProtocol
    private var cancellableBag = CancellableBag()
    
    // MARK: - init
    
    init(productsRepository: ProductsRepositoryProtocol = ProductsRepository()) {
        self.productsRepository = productsRepository
    }
    
    // MARK: - Methods
    
    func loadProducts() {
        isLoading = true
        productsRepository.getProducts()
            .tryCompactMap(\.results)
            .sink { [weak self] status in
                self?.isLoading = false
                if case let .failure(error) = status {
                    self?.error = error as? NetworkError
                }
            } receiveValue: { [weak self] result in
                self?.products = result.compactMap(Product.init)
            }.store(in: &cancellableBag)
    }
}
