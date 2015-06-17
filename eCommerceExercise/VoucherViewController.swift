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


}
