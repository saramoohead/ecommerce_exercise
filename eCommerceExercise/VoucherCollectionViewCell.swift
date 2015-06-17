//
//  VoucherCollectionViewCell.swift
//  eCommerceExercise
//
//  Created by Sara OC on 17/06/2015.
//  Copyright (c) 2015 Sara OC Inc. All rights reserved.
//

import UIKit

class VoucherCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageBorder: UIImageView!
    @IBOutlet weak var voucherCategory: UILabel!
    @IBOutlet weak var voucherImage: UIImageView!
    @IBOutlet weak var voucherConditions: UILabel!

    @IBOutlet weak var addToCartButton: UIButton!
    @IBOutlet weak var removeFromCartButton: UIButton!
}
