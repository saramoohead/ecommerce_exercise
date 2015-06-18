
var target = UIATarget.localTarget();
var view = target.frontMostApp().mainWindow();
var currentTest;
var failuresFound = false;
var currentItBlock;
var failuresFoundInItBlock;
var beVerbose

function describe(testDescription, testCode, verbose) {
    beVerbose = !!verbose
    currentTest = testDescription
    beginTest(testDescription);
    testCode.call();
    endTest();
}

function it(testDescription, testCode) {
    currentItBlock = testDescription;
    failuresFoundInItBlock = false;
    if (beVerbose) { UIALogger.logMessage("___Test: " + currentItBlock); }
    testCode.call();
    if (failuresFoundInItBlock) {
        UIALogger.logFail("___Failed: " + currentItBlock);
    } else {
        if (beVerbose) { UIALogger.logPass("___Passed: " + currentItBlock); }
    }
}

function beginTest(testDescription, target) {
    UIALogger.logMessage("BEGIN TEST ***** " + testDescription + " *****");
}

function endTest() {
    if (failuresFound) {
        UIALogger.logFail("TEST FAILED ***** " + currentTest + " *****");
    } else {
        UIALogger.logPass("TEST PASSED ***** " + currentTest + " *****");
    }
}

function testPass(passString) {
    if (beVerbose) { UIALogger.logPass("______PASS: " + passString); }
}

function testFailure(failString) {
    failuresFound = true;
    failuresFoundInItBlock = true;
    UIALogger.logFail("______FAIL: " + failString);
}

// matchers

function readText(text) {
    if (view.staticTexts()[text].isValid()) {
        testPass("Found text '" + text + "'");
    } else {
        testFailure("Could not find text '" + text + "'");
    }
}

function readButtonText(text) {
    if (view.buttons()[text].isValid()) {
        testPass("Found button text '" + text + "'");
    } else {
        testFailure("Could not find button text '" + text + "'");
    }
}

function fillInTextField(field, text) {
    var textField = view.textFields()[field]
    if (textField.isValid()) {
        textField.setValue(text);
        testPass("Filled in '" + field + "' with '" + text + "'");
    } else {
        testFailure("Could not find field '" + field + "'");
    }
}

function tapButton(button) {
    var buttonToTap = view.buttons()[button]
    if (buttonToTap.isValid()) {
        buttonToTap.tap();
        testPass("Tapped button '" + button + "'");
    } else {
        testFailure("Could not find button '" + button + "'");
    }
}

function swipe(direction, on) {
    swipeTarget = on || view;
    switch(direction) {
        case "left":
            swipeTarget.dragInsideWithOptions({startOffset:{x:1, y:0.5}, endOffset:{x:0, y:0.5}, duration:0.2});
            break;
        case "right":
            swipeTarget.dragInsideWithOptions({startOffset:{x:0, y:0.5}, endOffset:{x:1, y:0.5}, duration:0.2});
            break;
        case "up":
            swipeTarget.dragInsideWithOptions({startOffset:{x:0.5, y:0.8}, endOffset:{x:0.5, y:0}, duration:0.2});
            break;
        case "down":
            swipeTarget.dragInsideWithOptions({startOffset:{x:0.5, y:0.2}, endOffset:{x:0.5, y:1}, duration:0.2});
            break;
    }
}

// collection matchers

function readTextInCollection(text) {
    var textFound = false;
    var cell;
    var collectionCellArray = view.collectionViews()[0].cells();
    for (var i = 0; i < collectionCellArray.length; i ++) {
        cell = collectionCellArray[i];
        if (cell.staticTexts()[text].isValid()) {
            textFound = true;
            break;
        }
    }
    if (textFound) {
        testPass("Found text '" + text + "'");
    } else {
        testFailure("Could not find text '" + text + "'");
    }
}

function findButtonInDesignatedCollectionCell(cell, button) {
    var buttonFound = false;
//    var cell;
    var collectionCellArray = view.collectionViews()[0].cells();

    chosenCell = collectionCellArray[cell];
    if (chosenCell.buttons()[button].isValid()) {
        buttonFound = true;
    }

    if (buttonFound) {
        testPass("Found button '" + button + "'");
    } else {
        testFailure("Could not find button '" + button + "'");
    }
}

function tapButtonInDesignatedCollectionCell(cell, button) {
//    var cell;
    var collectionCellArray = view.collectionViews()[0].cells();
    
    chosenCell = collectionCellArray[cell];
    var buttonToTap = chosenCell.buttons()[button];
    if (buttonToTap.isValid()) {
        buttonToTap.tap();
        testPass("Tapped button '" + button + "'");
    } else {
        testFailure("Could not find button '" + button + "'");
    }
}
