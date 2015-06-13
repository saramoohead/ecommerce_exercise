#import "eyeTestMatchers.js"

describe("storefront", function() {

    it("can display product names", function() {
        readText("Suede Shoes");
    });

}, "verbose");
