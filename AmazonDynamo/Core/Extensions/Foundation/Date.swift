//
//  Date.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import Foundation

extension Date {
    
    init(_ dateString: String, format: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        self = formatter.date(from: dateString) ?? Date()
    }
}
