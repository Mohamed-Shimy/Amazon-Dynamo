//
//  ProductView.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import SwiftUI

struct ProductView: View {
    
    let product: Product
    let style: DisplayStyle
    
    var body: some View {
        switch style {
            case .grid: ProductGridView(product: product).id(product.id)
            case .list: ProductsListView(product: product).id(product.id)
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            ProductView(product: .preview, style: .grid)
            
            ProductView(product: .preview, style: .list)
        }
        .padding()
        .previewLayout(.sizeThatFits)
    }
}
