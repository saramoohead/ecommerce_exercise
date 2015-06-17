//
//  CalculatorBrain.swift
//  eCommerceExercise
//
//  Created by Sara OC on 14/06/2015.
//  Copyright (c) 2015 Sara OC Inc. All rights reserved.
//

import Foundation

class CartBrain {

    var cartProducts = [Int]()
    var cartVouchers = [Int]()
    var productData = ProductList()
    var voucherData = VoucherList()
    
    func removeObject<T : Equatable>(object: T, inout fromArray array: [T])
    {
        var index = find(array, object)
        array.removeAtIndex(index!)
    }

    var total: Float = 0
    
    func totalCart() {
        total = 0
        for item in cartProducts {
            total += (productData.productPrice[item] as NSString).floatValue
        }
    }

}