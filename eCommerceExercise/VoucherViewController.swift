//
//  VoucherViewController.swift
//  eCommerceExercise
//
//  Created by Sara OC on 17/06/2015.
//  Copyright (c) 2015 Sara OC Inc. All rights reserved.
//

import UIKit

class VoucherViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    // voucher collection view set up
    
    var data = VoucherList()

    @IBOutlet weak var voucherCollection: UICollectionView!

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.voucherCategory.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let voucherCell = collectionView.dequeueReusableCellWithReuseIdentifier("voucherCell", forIndexPath: indexPath) as! VoucherCollectionViewCell
        voucherCell.voucherCategory.text = data.voucherCategory[indexPath.row]
        voucherCell.voucherConditions.text = data.voucherConditional[indexPath.row]
        voucherCell.voucherImage.image = UIImage(named: data.voucherImage[indexPath.row])
        
        voucherCell.addToCartButton.tag = indexPath.row
        voucherCell.addToCartButton.addTarget(self, action: "addToCart:", forControlEvents: .TouchUpInside)
        
        voucherCell.removeFromCartButton.hidden = true
        voucherCell.removeFromCartButton.tag = indexPath.row
        voucherCell.removeFromCartButton.addTarget(self, action: "removeFromCart:", forControlEvents: .TouchUpInside)
        
        if contains(cart.cartVouchers, indexPath.row) {
            voucherCell.removeFromCartButton.hidden = false
            voucherCell.addToCartButton.hidden = true
        } else {
            voucherCell.removeFromCartButton.hidden = true
            voucherCell.addToCartButton.hidden = false
        }
        
        return voucherCell
    }
    
    var cart = CartBrain()
    
    func addToCart(sender: UIButton) {
        let selectedVoucher = sender.tag
        println("***senderTag")
        println(selectedVoucher)
        cart.cartVouchers.append(selectedVoucher)
        updateCartDisplay()
        voucherCollection.reloadData()
        println("***addToCart")
        println(cart.cartProducts)
        println(cart.cartVouchers)
    }
    
    func removeFromCart(sender: UIButton) {
        let selectedVoucher = sender.tag
        cart.removeObject(selectedVoucher, fromArray: &cart.cartVouchers)
        updateCartDisplay()
        voucherCollection.reloadData()
        println("***removeFromCart")
        println(cart.cartProducts)
        println(cart.cartVouchers)
    }
    
    // shopping bag "cart" display
    
    func updateCartDisplay() {
        cartItemCount.setTitle("\(cart.cartProducts.count)", forState: UIControlState.Normal)
        cart.totalCart()
        cartTotal.text = "£" + String.localizedStringWithFormat("%.2f", cart.total)
    }

    // passing cart data between views

    @IBOutlet weak var cartItemCount: UIButton!
    @IBOutlet weak var cartTotal: UILabel!
    
    var passedTotal:String!
    var passedCartContents:[Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if passedTotal != nil {
            cartTotal.text = passedTotal
            cart.cartProducts = passedCartContents
            cartItemCount.setTitle("\(cart.cartProducts.count)", forState: UIControlState.Normal)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueFromVouchers") {
            var svc = segue.destinationViewController as! ProductViewController;
            
            svc.passedTotalFromVouchers = passedTotal
            svc.passedCartContentsFromVouchers = passedCartContents
            
        }
    }

}
