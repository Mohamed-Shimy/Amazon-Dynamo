//
//  ProductDetailsView.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import SwiftUI

struct ProductDetailsView: View {
    
    let product: Product
    
    var body: some View {
        VStack {
            HStack {
                Text(Date(product.createdAt, format: "yyyy-MM-dd HH:mm:ss.SSS"),
                     style: .date)
                    .foregroundColor(.secondary)
                Spacer()
                Text(product.price)
                    .font(.title3).bold()
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.orange)
                    .clipShape(Capsule())
            }
            .padding(.horizontal)
            
            ScrollView(.vertical) {
                ForEach(product.imageURLs, id: \.self) { imageURL in
                    AsyncImage(url: URL(string: imageURL)) { image in
                        image.resizable()
                    } placeholder: {
                        ProgressView().padding()
                    }
                    .aspectRatio(contentMode: .fit)
                    .clipped()
                    .cornerRadius(10)
                    .padding(.horizontal)
                }
            }
        }
        .navigationTitle(product.name)
    }
}

struct ProductDetailsView_Previews: PreviewProvider {
    
    static var previews: some View {
        NavigationView {
            ProductDetailsView(product: .preview)
        }
    }
}
