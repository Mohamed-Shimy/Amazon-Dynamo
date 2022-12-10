//
//  AmazonDynamoApp.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//

import SwiftUI

@main
struct AmazonDynamoApp: App {
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ProductsView(viewModel: ProductsViewModel())
                
                // For Sidebar Navigation
                Label("Select product from the list", systemImage: "arrowshape.turn.up.backward.2")
            }
        }
    }
}
