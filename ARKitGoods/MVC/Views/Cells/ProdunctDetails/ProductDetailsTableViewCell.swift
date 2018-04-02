//
//  ProductDetailsTableViewCell.swift
//  ARKitGoods
//
//  Created by Dzionis Brek on 3/31/18.
//  Copyright © 2018 Dzionis Brek. All rights reserved.
//

import UIKit

class ProductDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemTitleLabel: UILabel!
    @IBOutlet weak var itemDescriptionLabel: UILabel!
    @IBOutlet weak var itemPriceLabel: UILabel!
    
    func configure(_ product: Product) {
        if let name = product.name {
            itemTitleLabel.text = name
        }
        if let description = product.details {
            itemDescriptionLabel.text = description
        }
        if let price = product.price {
            itemPriceLabel.text = price
        }
        if let name = product.name {
            itemTitleLabel.text = name
        }
        if let imageName = product.imageName {
            itemImageView.image = UIImage(named: imageName)
        }
    }
}
