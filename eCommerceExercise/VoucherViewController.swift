//
//  VoucherViewController.swift
//  eCommerceExercise
//
//  Created by Sara OC on 16/06/2015.
//  Copyright (c) 2015 Sara OC Inc. All rights reserved.
//

import UIKit

class VoucherViewController: ProductViewController {

    @IBOutlet weak var cartButtonOutlet: UIButton!
    
    // passing cart data between views
    
    var passedTotal:String!
    var passedCartContents:[Int]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cartTotalDisplay.text = passedTotal
        cartButtonOutlet.setTitle("\(passedCartContents.count)", forState: UIControlState.Normal)
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "segueFromVouchers") {
            var svc = segue.destinationViewController as! ProductViewController;
            
            svc.passedTotalFromVouchers = passedTotal
            svc.passedCartContentsFromVouchers = passedCartContents
            
        }
    }
    
}
