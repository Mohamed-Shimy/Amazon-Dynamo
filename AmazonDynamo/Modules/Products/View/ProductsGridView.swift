//
//  ProductsGridView.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import SwiftUI

struct ProductsGridView: View {
    
    let products: [Product]
    let style: DisplayStyle
    let size: CGSize
    
    private var gridColumns: [GridItem] {
        if size.width > 400, style != .list {
            let count = (size.width / 300) + 1
            return Array(repeating: GridItem(.fixed(size.width / count)),
                         count: Int(count))
        }
        return [GridItem(.fixed(size.width))]
    }
    
    var body: some View {
        LazyVGrid(columns: gridColumns, spacing: 10) {
            ForEach(products) { product in
                NavigationLink {
                    ProductDetailsView(product: product)
                } label: {
                    ProductView(product: product, style: style)
                }
                .buttonStyle(.plain)
            }
        }
    }
}

struct ProductsGridView_Previews: PreviewProvider {
    
    static var previews: some View {
        GeometryReader { proxy in
            ProductsGridView(products: [], style: .grid, size: proxy.size)
        }
    }
}
