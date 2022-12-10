//
//  NetworkManagable.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import Foundation
import Moya
import Combine

protocol NetworkManagable: AnyObject {
    
    associatedtype Target: TargetType
    func request<D: Decodable>(_ target: Target) -> AnyPublisher<D, Error>
}
