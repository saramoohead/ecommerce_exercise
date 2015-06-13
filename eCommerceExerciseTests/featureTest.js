#import "eyeTestMatchers.js"

describe("storefront", function() {

    it("can display product names", function() {
        readText("Almond Toe Court Shoes");
    });
    
    it("can display product prices", function () {
       readText("£99.00");
    });

}, "verbose");
