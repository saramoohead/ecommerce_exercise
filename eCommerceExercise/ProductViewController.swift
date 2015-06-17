//
//  ViewController.swift
//  eCommerceExercise
//
//  Created by Sara OC on 13/06/2015.
//  Copyright (c) 2015 Sara OC Inc. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    // product collection view set up
    
    var data = ProductList()
    
    @IBOutlet weak var productCell: UICollectionView!

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.productTitle.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        cell.labelNameCell.text = data.productTitle[indexPath.row]
        cell.labelNameCell.adjustsFontSizeToFitWidth = true;
        cell.labelDescriptionCell.text = data.productDescription[indexPath.row]
        cell.labelGenderCell.text = data.productGender[indexPath.row]
        cell.labelCategoryCell.text = data.productCategory[indexPath.row]
        cell.labelPriceCell.text = "£" + data.productPrice[indexPath.row]
        cell.labelStockCell.text = data.productStock[indexPath.row] + " available"
        cell.imageCell.image = UIImage(named: data.productImage[indexPath.row])
        cell.imageBorderCell.image = UIImage(named: "line.png")
        
        cell.addToCartButton.tag = indexPath.row
        cell.addToCartButton.addTarget(self, action: "addToCart:", forControlEvents: .TouchUpInside)
        
        cell.removeFromCartButton.hidden = true
        cell.removeFromCartButton.tag = indexPath.row
        cell.removeFromCartButton.addTarget(self, action: "removeFromCart:", forControlEvents: .TouchUpInside)
        
        if contains(cart.cartProducts, indexPath.row) {
            cell.removeFromCartButton.hidden = false
            cell.addToCartButton.hidden = true
        } else {
            cell.removeFromCartButton.hidden = true
            cell.addToCartButton.hidden = false
        }
        
        return cell
    }
    
    // add and remove from cart
    
    var cart = CartBrain()
    
    func addToCart(sender: UIButton) {
        let selectedProduct = sender.tag
        cart.cartProducts.append(selectedProduct)
        updateCartDisplay()
        productCell.reloadData()
    }
    
    func removeFromCart(sender: UIButton) {
        let selectedProduct = sender.tag
        cart.removeObject(selectedProduct, fromArray: &cart.cartProducts)
        checkVouchersAgain()
        updateCartDisplay()
        productCell.reloadData()
    }
    
    func checkVouchersAgain() {
        for item in cart.cartVouchers {
            if cart.checkVoucher(item) == false {
                cart.removeObject(item, fromArray: &cart.cartVouchers)
            }
        }
    }
    
    // shopping bag "cart" display

    @IBOutlet weak var cartButton: UIButton!
    @IBOutlet weak var cartTotalDisplay: UILabel!
    
    func updateCartDisplay() {
        cartButton.setTitle("\(cart.cartProducts.count)", forState: UIControlState.Normal)
        cart.totalCart()
        cartTotalDisplay.text = "£" + String.localizedStringWithFormat("%.2f", cart.total)
    }
    
    // pass cart data between views
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueToVouchers") {
            var svc = segue.destinationViewController as! VoucherViewController;
            
            svc.passedTotal = cartTotalDisplay.text
            svc.passedCartContents = cart.cartProducts
            svc.passedVouchers = cart.cartVouchers
        }
    }
    
    var passedTotalFromVouchers:String!
    var passedCartContentsFromVouchers:[Int]!
    var passedCartVouchersFromVouchers:[Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if passedTotalFromVouchers != nil {
            cartTotalDisplay.text = passedTotalFromVouchers
            cartButton.setTitle("\(passedCartContentsFromVouchers.count)", forState: UIControlState.Normal)
            cart.cartProducts = passedCartContentsFromVouchers
            cart.cartVouchers = passedCartVouchersFromVouchers
        }
    }


}


