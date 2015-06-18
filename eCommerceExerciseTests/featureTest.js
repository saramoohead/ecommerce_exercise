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
    
    it("sees the correct total (including the £5 off from previous test)", function() {
        readText("£126.00");
    });
         
}, "verbose");

describe("Voucher is removed if qualifying items are removed", function() {

    it("taps the Back to shopping button", function() {
        tapButton("toShoppingView");
    });
         
    it("removes qualifying item", function() {
        tapButtonInDesignatedCollectionCell(0, "Remove from cart");
    });
     
    it("sees the correct total with only the £5 off voucher included", function() {
        readText("£37.00");
    });

}, "verbose");

describe("User is alerted if they try to add an invalid voucher", function() {
         
    it("taps the Vouchers? button", function() {
        tapButton("toVouchersView");
    });
     
    it("taps the £10 off if order is over £50 button", function() {
        tapButtonInDesignatedCollectionCell(1, "addVoucherToCartButton");
    });
     
    it("sees an error message", function() {
        readText("Your order doesn't qualify for this voucher.");
    });

}, "verbose");


describe("User sees stock decrease when added to their cart", function() {
    
    it("taps the Back to shopping button", function() {
        tapButton("toShoppingView");
    });
         
    it("sees the availability of an item", function() {
        readTextInDesignatedCollectionCell(0, "5 available");
    });
    
    it("adds that item to cart", function() {
        tapButtonInDesignatedCollectionCell(0, "Add to cart");
    });
         
    it("sees the availability descrease by one", function() {
        readTextInDesignatedCollectionCell(0, "4 available");
    });
         
}, "verbose");

describe("User is unable to add out of stock items to cart", function() {
         
    it("scrolls down", function() {
        swipe("up")
    });
     
    it("taps on a product that is out of stock", function() {
        tapButtonInDesignatedCollectionCell(4, "Add to cart");
    });
     
    it("sees an error message", function() {
        readText("This item is out of stock.");
    });
         
 }, "verbose");
