//
//  DisplayStyle.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import Foundation

enum DisplayStyle {
    
    case grid
    case list
    
    func toggled() -> Self {
        self == .list ? .grid : .list
    }
}

extension DisplayStyle {
    
    var iconSystemName: String {
        switch self {
            case .grid: return "square.grid.2x2"
            case .list: return "rectangle.grid.1x2"
        }
    }
}
