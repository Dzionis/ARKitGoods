//
//  ProductDetailsViewController.swift
//  ARKitGoods
//
//  Created by Dzionis Brek on 3/28/18.
//  Copyright © 2018 Dzionis Brek. All rights reserved.
//

import UIKit

enum ProductDetailsCellType: NSInteger {
    case details
    case buy
}

class ProductDetailsViewController: UIViewController, InstantiatableFromStoryboard {
    
    @IBOutlet weak var tableView: UITableView!
    private var product: Product?
    private var cells = [ProductDetailsCellType]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configure(_ product: Product) {
        self.product = product
        cells = [.details, .buy]
    }
    
    // MARK: - Instantiation
    
    class func instantiateFromStoryboard<T>() -> T {
        return UIStoryboard.main.instantiateViewController(withIdentifier: String(describing: ProductDetailsViewController.self)) as! T
    }

}

extension ProductDetailsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellType = cells[indexPath.row]
        switch cellType {
        case .buy:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductBuyTableViewCell.self), for: indexPath) as! ProductBuyTableViewCell
            cell.delegate = self
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: ProductDetailsTableViewCell.self), for: indexPath) as! ProductDetailsTableViewCell
            cell.configure(product!)
            return cell
        }
    }
}

extension ProductDetailsViewController: ProductBuyTableViewCellDelegate {
    
    func buyClicked(_ button: UIButton) {
        
    }
    
    func tryClicked(_ button: UIButton) {
        let arViewController = ProductARViewController.instantiateFromStoryboard() as ProductARViewController
        arViewController.productName = product?.model
        self.navigationController?.pushViewController(arViewController, animated: true)
    }
}
