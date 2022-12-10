//
//  Methods.swift
//  AmazonDynamo
//
//  Created by Mohamed Shemy on 10/12/2022.
//  Copyright © 2022 Mohamed Shimy. All rights reserved.
//

import Foundation

func printForDebug(_ items: Any..., separator: String = " ", terminator: String = "\n") {
#if DEBUG
    print(items, separator: separator, terminator: terminator)
#endif
}
