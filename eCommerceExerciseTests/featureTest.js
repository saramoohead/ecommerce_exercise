#import "eyeTestMatchers.js"

describe("User can view product information required in brief", function() {

    it("product names", function() {
        readTextInCollection("Almond Toe Court Shoes");
    });
    
    it("product prices", function () {
        readTextInCollection("£99.00");
    });
         
    it("product categories", function () {
        readTextInCollection("Footwear");
    });

    it("product availability", function () {
        readTextInCollection("5 available");
    });
         
}, "verbose");

describe("User can add a product to cart", function() {

    it("by seeing the Add to cart button", function () {
        findButtonInDesignatedCollectionCell(0, "Add to cart");
    });

    it("tapping the Add to cart button", function () {
        tapButtonInDesignatedCollectionCell(0, "Add to cart");
    });
     
    it("then sees cart item count increase by 1", function() {
        readButtonText("1");
    });

}, "verbose");

describe("User can remove a product from cart", function() {
         
    it("sees cart total is 1", function() {
        readButtonText("1");
    });
         
    it("sees the Remove from cart button appear", function () {
        findButtonInDesignatedCollectionCell(0, "Remove from cart");
    });
     
    it("taps the Remove from cart", function () {
        tapButtonInDesignatedCollectionCell(0, "Remove from cart");
    });
     
    it("then sees cart item count decrease by 1", function() {
        readButtonText("0");
    });
         
}, "verbose");

describe("User can view total price for items in cart", function() {

    it("adds two products to the cart", function() {
        tapButtonInDesignatedCollectionCell(0, "Add to cart");
        tapButtonInDesignatedCollectionCell(1, "Add to cart");
    });
         
    it("then sees correct total under cart", function() {
        readText("£141.00");
    });
    
}, "verbose");

describe("User can add vouchers to cart", function() {

    it("taps the Vouchers? button", function() {
        tapButton("toVouchersView");
    });

    it("sees the voucher collection", function() {
        readTextInCollection("£5 off any order");
    });
    
    it("taps the £5 off button", function() {
        tapButtonInDesignatedCollectionCell(0, "addVoucherToCartButton");
    });

}, "verbose");

describe("User sees vouchers deductions included in total", function() {
         
    it("taps the £10 off button", function() {
        tapButtonInDesignatedCollectionCell(1, "addVoucherToCartButton");
        });
     
    it("sees the correct total", function() {
        readText("£126.00");
    });
         
}, "verbose");


