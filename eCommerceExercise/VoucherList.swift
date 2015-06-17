//
//  VoucherList.swift
//  eCommerceExercise
//
//  Created by Sara OC on 16/06/2015.
//  Copyright (c) 2015 Sara OC Inc. All rights reserved.
//

import Foundation

class VoucherList {

    let voucherDisplayCategory: [String] = ["General", "General", "Footwear"]
    let voucherImage: [String] = ["5poundsoff.png", "10poundsoff.png", "15poundsoff.png"]
    let voucherConditionDescription: [String] = ["£5 off any order", "£10 off when you spend over £50", "£15 off when you spend over £75 and buy any item of footwear"]
    let voucherMoneyOff: [Float] = [5, 10, 15]
    let voucherMinimum: [Int] = [0, 50, 75]
    let voucherRequiredProductCategory: [String] = ["", "", "Footwear"]

}
