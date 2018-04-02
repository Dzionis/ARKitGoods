//
//  ViewController.swift
//  ARKitGoods
//
//  Created by Dzionis Brek on 3/26/18.
//  Copyright © 2018 Dzionis Brek. All rights reserved.
//

import UIKit

class ProductsListViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    var productList = [Product]()
    
    fileprivate let itemsPerRow: CGFloat = 2.0
    fileprivate let sectionInsets = UIEdgeInsets(top: 12.0, left: 20.0, bottom: 12.0, right: 20.0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Catalog"
        
        let reuseIdentifier = String(describing: ProductCollectionViewCell.self)
        let nib = UINib(nibName: reuseIdentifier, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: reuseIdentifier)
        loadItems()
    }
    
    func loadItems() {
        if let path = Bundle.main.path(forResource: "products", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .alwaysMapped)
                let jsonResult = try JSONSerialization.jsonObject(with: data)
                productList = Product.products(array: jsonResult as! [Dictionary<String, AnyObject>])
            } catch let error {
                print("parse error: \(error.localizedDescription)")
            }
        } else {
            print("Invalid filename/path.")
        }
    }
}

extension ProductsListViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return productList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let reuseIdentifier = String(describing: ProductCollectionViewCell.self)
        let cell: ProductCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                                                                 for: indexPath) as! ProductCollectionViewCell
        cell.configure(productList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let detailsViewController = ProductDetailsViewController.instantiateFromStoryboard() as ProductDetailsViewController
        detailsViewController.configure(productList[indexPath.row])
        self.navigationController?.pushViewController(detailsViewController, animated: true)
    }
}

//https://www.raywenderlich.com/136159/uicollectionview-tutorial-getting-started
extension ProductsListViewController : UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
    
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = view.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem + 76)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}

