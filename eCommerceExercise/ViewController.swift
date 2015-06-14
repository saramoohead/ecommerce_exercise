//
//  ViewController.swift
//  eCommerceExercise
//
//  Created by Sara OC on 13/06/2015.
//  Copyright (c) 2015 Sara OC Inc. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    var data = ProductList()
    
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
        cell.labelDescriptionCell.text = data.tableDescription[indexPath.row]
        cell.labelGenderCell.text = data.tableGender[indexPath.row]
        cell.labelCategoryCell.text = data.tableCategory[indexPath.row]
        cell.labelPriceCell.text = "£" + data.tablePrice[indexPath.row]
        cell.labelStockCell.text = data.tableStock[indexPath.row] + " available"
        cell.imageCell.image = UIImage(named: data.tableImage[indexPath.row])
        cell.imageBorderCell.image = UIImage(named: "line.png")
        
        cell.addToCartButton.tag = indexPath.row
        cell.addToCartButton.addTarget(self, action: "addToCart:", forControlEvents: .TouchUpInside)
        
        return cell
    }
    
    @IBAction func addToCart(sender: UIButton) {
        let selectedProduct = sender.tag
        println(selectedProduct)
    }
    
//    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
//        println("Cell \(indexPath.row) selected")
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

