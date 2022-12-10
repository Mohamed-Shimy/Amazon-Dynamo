//
//  ProductsView.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import SwiftUI

struct ProductsView<ViewModel: ProductsViewModelProtocol>: View {
    
    @StateObject var viewModel: ViewModel
    @State private var style: DisplayStyle = .grid
    
    var body: some View {
        GeometryReader { proxy in
            ScrollView(.vertical) {
                ProductsGridView(products: viewModel.products,
                                 style: style, size: proxy.size)
            }
        }
        .navigationTitle("Products")
        .showLoading(viewModel.isLoading)
        .refreshable {
            viewModel.loadProducts()
        }
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Button {
                    withAnimation {
                        style = style.toggled()
                    }
                } label: {
                    Image(systemName: style.toggled().iconSystemName)
                        .foregroundColor(.primary)
                }
            }
        }
        .alert(item: $viewModel.error) { error in
            Alert(title: Text("Error"),
                  message: Text(error.message),
                  dismissButton: .cancel())
        }
    }
    
    init(viewModel: ViewModel) {
        _viewModel = .init(wrappedValue: viewModel)
        viewModel.loadProducts()
    }
}

struct ProductsView_Previews: PreviewProvider {
    
    static var previews: some View {
        ProductsView(viewModel: ProductsViewModel())
    }
}
