//
//  InfiniteScrollUITests.swift
//  InfiniteScrollUITests
//
//  Created by Anirudh Das on 7/8/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import XCTest
@testable import InfiniteScroll

class InfiniteScrollUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testAlertOnInvalidInput() {
        let app = XCUIApplication()
        let nametxtfldTextField = app/*@START_MENU_TOKEN@*/.textFields["NameTxtFld"]/*[[".textFields[\"Full Name\"]",".textFields[\"NameTxtFld\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nametxtfldTextField.tap()
        app/*@START_MENU_TOKEN@*/.buttons["StartBtn"]/*[[".buttons[\"Start\"]",".buttons[\"StartBtn\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.alerts["Invalid Entry!"].buttons["OK"].tap()
        
        XCTAssertEqual(nametxtfldTextField.label, "")
    }
    
    func testImageRenderingOnValidInput() {
        
        let app = XCUIApplication()
        let nametxtfldTextField = app/*@START_MENU_TOKEN@*/.textFields["NameTxtFld"]/*[[".textFields[\"Full Name\"]",".textFields[\"NameTxtFld\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nametxtfldTextField.tap()
        nametxtfldTextField.typeText("Anirudh")
        app/*@START_MENU_TOKEN@*/.buttons["StartBtn"]/*[[".buttons[\"Start\"]",".buttons[\"StartBtn\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        
        let collectionView = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .collectionView).element
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeUp()
        collectionView.swipeDown()
        
        let name = app.staticTexts["NameLbl"]
        XCTAssertEqual(name.label, "Anirudh")
        XCTAssertTrue(!name.label.isEmpty)
        
        let time = app.staticTexts["TimeLbl"]
        XCTAssertTrue(!time.label.isEmpty)
        XCTAssertEqual(time.label.count, "Sun, 8 Jul 2018 09:56:10:45 AM".count)
    }
    
    func testTapOnImage() {
        let app = XCUIApplication()
        let nametxtfldTextField = app/*@START_MENU_TOKEN@*/.textFields["NameTxtFld"]/*[[".textFields[\"Full Name\"]",".textFields[\"NameTxtFld\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        nametxtfldTextField.tap()
        nametxtfldTextField.typeText("Anirudh")
        app/*@START_MENU_TOKEN@*/.buttons["StartBtn"]/*[[".buttons[\"Start\"]",".buttons[\"StartBtn\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.collectionViews.children(matching: .cell).element(boundBy: 0).otherElements.containing(.image, identifier:"PixlrImgView").element.tap()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element(boundBy: 1).children(matching: .other).element.children(matching: .scrollView).element.tap()
    }
}
