//
//  GoodsCollectionViewCell.swift
//  ARKitGoods
//
//  Created by Dzionis Brek on 3/26/18.
//  Copyright © 2018 Dzionis Brek. All rights reserved.
//

import UIKit

class ProductCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var itemImageView: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    @IBOutlet weak var itemPrice: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        itemImageView.layer.borderWidth = 0.3
        itemImageView.layer.borderColor = UIColor.lightGray.cgColor
        itemImageView.layer.cornerRadius = 4.0
    }
    
    func configure(_ item: Product) {
        if let name = item.name {
            itemLabel.text = name
        }
        if let price = item.price {
            itemPrice.text = price
        }
        if let imageName = item.imageName {
            itemImageView.image = UIImage(named: imageName)
        }
    }
}
