//
//  LoadingView.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import SwiftUI

struct LoadingView<Content: View>: View {
    
    var tintColor: Color = .accentColor
    let content: () -> Content
    
    var body: some View {
        ZStack {
            content()
            
            Color.black.opacity(0.2)
            
            ProgressView()
                .padding()
                .progressViewStyle(CircularProgressViewStyle(tint: tintColor))
                .background(Color(uiColor: .systemBackground))
                .foregroundColor(Color.primary)
                .cornerRadius(10)
        }
        .ignoresSafeArea()
    }
}

extension View {
    
    @ViewBuilder func showLoading(_ isLoading: Bool) -> some View {
        if isLoading {
            LoadingView() { self }
        } else {
            self
        }
    }
}
