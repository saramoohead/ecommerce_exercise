//
//  ViewController.swift
//  eCommerceExercise
//
//  Created by Sara OC on 13/06/2015.
//  Copyright (c) 2015 Sara OC Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var productCell: UICollectionView!
    
    var data = ProductList()
    var cart = CartBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.tableTitle.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        cell.labelNameCell.text = data.tableTitle[indexPath.row]
        cell.labelNameCell.adjustsFontSizeToFitWidth = true;
        cell.labelDescriptionCell.text = data.tableDescription[indexPath.row]
        cell.labelGenderCell.text = data.tableGender[indexPath.row]
        cell.labelCategoryCell.text = data.tableCategory[indexPath.row]
        cell.labelPriceCell.text = "£" + data.tablePrice[indexPath.row]
        cell.labelStockCell.text = data.tableStock[indexPath.row] + " available"
        cell.imageCell.image = UIImage(named: data.tableImage[indexPath.row])
        cell.imageBorderCell.image = UIImage(named: "line.png")
        
        cell.addToCartButton.tag = indexPath.row
        cell.addToCartButton.addTarget(self, action: "addToCart:", forControlEvents: .TouchUpInside)
        
        cell.removeFromCartButton.hidden = true
        cell.removeFromCartButton.tag = indexPath.row
        cell.removeFromCartButton.addTarget(self, action: "removeFromCart:", forControlEvents: .TouchUpInside)
        
        if contains(cart.cartContents, indexPath.row) {
            cell.removeFromCartButton.hidden = false
            cell.addToCartButton.hidden = true
        } else {
            cell.removeFromCartButton.hidden = true
            cell.addToCartButton.hidden = false
        }
        
        return cell
    }
    
    func addToCart(sender: UIButton) {
        let selectedProduct = sender.tag
        cart.cartContents.append(selectedProduct)
        println(cart.cartContents)
        updateCartCount()
        productCell.reloadData()
    }
    
    func removeFromCart(sender: UIButton) {
        let selectedProduct = sender.tag
        cart.removeObject(selectedProduct, fromArray: &cart.cartContents)
        println(cart.cartContents)
        updateCartCount()
        productCell.reloadData()
    }

    @IBOutlet weak var cartButton: UIButton!
    
    func updateCartCount() {
        cartButton.setTitle("\(cart.cartContents.count)", forState: UIControlState.Normal)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


