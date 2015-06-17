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
    var productTotal: Float = 0
    var voucherTotal: Float = 0
    
    func checkVoucher(selectedVoucher: Int) -> Bool {
        var accepted: Bool = false
        if Int(total) > voucherData.voucherMinimum[selectedVoucher] {
            accepted = true
        } else {
            accepted = false
        }
        
        if voucherData.voucherRequiredProductCategory[selectedVoucher] != "" {
            var cartCategories = [String]()
            for item in cartProducts {
                cartCategories.append(productData.productCategory[item])
            }
            var categoryToMatch = voucherData.voucherRequiredProductCategory[selectedVoucher]
            
            if find(cartCategories, categoryToMatch) != nil {
                accepted = true
            } else {
                accepted = false
            }
        }

        return accepted
    }
    
    func totalCart() {
        productTotal = 0
        voucherTotal = 0
        for item in cartProducts {
            productTotal += (productData.productPrice[item] as NSString).floatValue
        }
        for item in cartVouchers {
            voucherTotal += (voucherData.voucherMoneyOff[item])
        }
        total = productTotal - voucherTotal
    }

}