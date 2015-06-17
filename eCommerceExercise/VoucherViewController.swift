//
//  VoucherViewController.swift
//  eCommerceExercise
//
//  Created by Sara OC on 17/06/2015.
//  Copyright (c) 2015 Sara OC Inc. All rights reserved.
//

import UIKit

class VoucherViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var data = VoucherList()

    @IBOutlet weak var voucherCollection: UICollectionView!

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.voucherCategory.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let voucherCell = collectionView.dequeueReusableCellWithReuseIdentifier("voucherCell", forIndexPath: indexPath) as! VoucherCollectionViewCell
        
        return voucherCell
    }

    // passing cart data between views

    @IBOutlet weak var cartItemCount: UIButton!
    @IBOutlet weak var cartTotal: UILabel!
    
    var passedTotal:String!
    var passedCartContents:[Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        println("*********")
        println(passedTotal)
        println(passedCartContents)
        
        if passedTotal != nil {
            cartTotal.text = passedTotal
            cartItemCount.setTitle("\(passedCartContents.count)", forState: UIControlState.Normal)
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
