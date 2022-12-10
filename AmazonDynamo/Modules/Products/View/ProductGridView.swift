//
//  ProductGridView.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import SwiftUI

struct ProductGridView: View {
    
    let product: Product
    
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: product.imageURLsThumbnails.first ?? "")) { image in
                image.resizable()
            } placeholder: {
                ProgressView().padding()
            }
            .aspectRatio(contentMode: .fill)
            .clipped()
            
            HStack {
                Text(product.name).font(.title2)
                Spacer()
                Text(product.price).font(.subheadline)
            }
            .padding()
        }
        .background(Color(uiColor: .systemGray6))
        .cornerRadius(10)
        .padding(.horizontal)
    }
}

struct ProductGridView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProductGridView(product: .preview)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
