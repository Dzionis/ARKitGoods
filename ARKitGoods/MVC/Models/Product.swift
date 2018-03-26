//
//  Product.swift
//  ARKitGoods
//
//  Created by Dzionis Brek on 3/26/18.
//  Copyright © 2018 Dzionis Brek. All rights reserved.
//

import UIKit

class Product: NSObject {
    let name: String?
    let price: String?
    let imageName: String?
    
    init(dictionary: NSDictionary) {
        name = dictionary["name"] as? String
        price = dictionary["price"] as? String
        imageName = dictionary["image"] as? String
    }
    
}
