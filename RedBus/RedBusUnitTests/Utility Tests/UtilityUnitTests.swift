//
//  UtilityUnitTests.swift
//  RedBusUnitTests
//
//  Created by Anirudh Das on 8/24/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import RedBus

class UtilityUnitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testStringToDate() {
        let dateString = "22/12/2018 11:00:10 AM"
        XCTAssertNotNil(dateString.toDate(format: "dd/MM/yyyy h:mm:ss a"), "Successful Conversion")
    }
    
    func testDateToString() {
        let nowDate = Date()
        XCTAssertNotNil(nowDate.toString(with: "dd/MM/yyyy h:mm:ss a"), "Successful Conversion")
    }
}
