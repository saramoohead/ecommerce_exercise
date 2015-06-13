//
//  ViewController.swift
//  eCommerceExercise
//
//  Created by Sara OC on 13/06/2015.
//  Copyright (c) 2015 Sara OC Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var tableTitle: [String] = ["Almond Toe Court Shoes", "Suede Shoes", "Leather Driver Saddle Loafers"]
    var tableDescription: [String] = ["Patent Black", "Blue", "Tan"]
    var tableGender: [String] = ["W", "W", "M"]
    var tableCategory: [String] = ["Footwear", "Footwear", "Footwear"]
    var tableImage: [String] = ["ATCS_PB.jpeg", "SS_B.png", "LDSL_T.jpeg"]
    var tablePrice: [String] = ["99.00", "42.00", "34.00"]
    var tableStock: [String] = ["5", "4", "12"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tableTitle.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as! CollectionViewCell
        cell.labelNameCell.text = tableTitle[indexPath.row]
        cell.labelDescriptionCell.text = tableDescription[indexPath.row]
        cell.labelGenderCell.text = tableGender[indexPath.row]
        cell.labelCategoryCell.text = tableCategory[indexPath.row]
        cell.labelPriceCell.text = "£" + tablePrice[indexPath.row]
        cell.labelStockCell.text = tableStock[indexPath.row] + " available"
        cell.imageCell.image = UIImage(named: tableImage[indexPath.row])
        cell.imageBorderCell.image = UIImage(named: "line.png")
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        println("Cell \(indexPath.row) selected")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

