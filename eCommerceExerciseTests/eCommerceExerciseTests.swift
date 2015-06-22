//
//  eCommerceExerciseTests.swift
//  eCommerceExerciseTests
//
//  Created by Sara OC on 13/06/2015.
//  Copyright (c) 2015 Sara OC Inc. All rights reserved.
//

import UIKit
import XCTest

class eCommerceExerciseTests: XCTestCase {
    
    let cart = CartBrain()
    let productVC = ProductViewController()
    let productView = CollectionViewCell()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testStartsWithAnEmptyCart() {
        let cartCount = cart.cartProducts.count
        XCTAssertEqual(cartCount, 0, "Cart begins empty")
    }
    
    func testAddItemToCart() {
        cart.cartProducts.append(0)
        let cartCount = cart.cartProducts.count
        XCTAssertEqual(cartCount, 1, "Cart accepts new items")
    }
    
    func testRemoveItemFromCart() {
        cart.cartProducts.append(0)
        cart.removeObject(0, fromArray: &cart.cartProducts)
        let cartCount = cart.cartProducts.count
    }

}
