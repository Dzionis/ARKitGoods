//
//  ProductBuyTableViewCell.swift
//  ARKitGoods
//
//  Created by Dzionis Brek on 3/31/18.
//  Copyright © 2018 Dzionis Brek. All rights reserved.
//

import UIKit

protocol ProductBuyTableViewCellDelegate: class {
    func buyClicked(_ button: UIButton)
    func tryClicked(_ button: UIButton)
}

class ProductBuyTableViewCell: UITableViewCell {
    
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var tryButton: UIButton!
    weak var delegate: ProductBuyTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        buyButton.layer.cornerRadius = 4.0
        tryButton.layer.cornerRadius = 4.0
        tryButton.layer.borderColor = UIColor.lightGray.cgColor
        tryButton.layer.borderWidth = 0.4
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func buyActionClicked(_ sender: UIButton) {
        delegate?.buyClicked(sender)
    }

    @IBAction func tryActionClicked(_ sender: UIButton) {
        delegate?.tryClicked(sender)
    }
}
