//
//  ProductsListView.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import SwiftUI

struct ProductsListView: View {
    
    let product: Product
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: product.imageURLsThumbnails.first ?? "")) { image in
                image.resizable()
            } placeholder: {
                ProgressView().padding()
            }
            .aspectRatio(contentMode: .fill)
            .clipped()
            .frame(width: 60)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(product.name).font(.title2)
                Text(product.price).font(.subheadline)
            }
            .padding()
            .frame(maxWidth: .infinity, alignment: .leading)
        }
        .background(Color(uiColor: .systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct ProductsListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProductsListView(product: .preview)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
