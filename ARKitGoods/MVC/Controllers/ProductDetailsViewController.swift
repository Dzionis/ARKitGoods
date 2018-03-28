//
//  ProductDetailsViewController.swift
//  ARKitGoods
//
//  Created by Dzionis Brek on 3/28/18.
//  Copyright © 2018 Dzionis Brek. All rights reserved.
//

import UIKit

class ProductDetailsViewController: UIViewController, InstantiatableFromStoryboard {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Instantiation
    
    class func instantiateFromStoryboard<T>() -> T {
        return UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: ProductDetailsViewController.self)) as! T
    }

}
