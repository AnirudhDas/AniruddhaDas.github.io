//
//  BusDetailUnitTests.swift
//  RedBusUnitTests
//
//  Created by Anirudh Das on 8/24/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import RedBus

// MARK: - Tests Init, Parsing and Equatable for PixlrImage
class BusDetailUnitTests: XCTestCase {
    
    func testParsingLogicOfBusDetailSuccess() {
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "ValidJSONData", ofType: "json"), let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
            let json = JSON(data: data)
            guard json != JSON.null, let RIN = json[ServerConfiguration.Response.rin].array, !RIN.isEmpty else {
                return
            }
            let busLogoBaseURL: String? = json[ServerConfiguration.Response.blu].string
            RIN.forEach({ (item) in
                if let InvList = item[ServerConfiguration.Response.invList].array {
                    for bus in InvList {
                        XCTAssertNotNil(BusDetail(bus, logoBaseURL: busLogoBaseURL), "Successful Parsing")
                    }
                }
            })
        } else {
            XCTFail("Error in reading file")
        }
    }
    
    func testParsingLogicOfBusDetailFailure() {
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "InvalidJSONData", ofType: "json"), let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
            let json = JSON(data: data)
            guard json != JSON.null, let RIN = json[ServerConfiguration.Response.rin].array, !RIN.isEmpty else {
                return
            }
            let busLogoBaseURL: String? = json[ServerConfiguration.Response.blu].string
            RIN.forEach({ (item) in
                if let InvList = item[ServerConfiguration.Response.invList].array {
                    for bus in InvList {
                        XCTAssertNil(BusDetail(bus, logoBaseURL: busLogoBaseURL), "Parsing Not Success")
                    }
                }
            })
        } else {
            XCTFail("Error in reading file")
        }
    }
    
    func testEquatableReturnsTrue() {
        let bundle = Bundle(for: type(of: self))
        if let path1 = bundle.path(forResource: "Bus1", ofType: "json"), let data1 = try? Data.init(contentsOf: URL.init(fileURLWithPath: path1)) {
            let json1 = JSON(data: data1)
            let bus1 = BusDetail(json1, logoBaseURL: "busLogoBaseURL")
            let bus2 = BusDetail(json1, logoBaseURL: "busLogoBaseURL")
            
            XCTAssertEqual(bus1, bus2)
        } else {
            XCTFail("Error in reading file")
        }
    }
    
    func testEquatableReturnsFalse() {
        let bundle = Bundle(for: type(of: self))
        if let path1 = bundle.path(forResource: "Bus1", ofType: "json"), let data1 = try? Data.init(contentsOf: URL.init(fileURLWithPath: path1)), let path2 = bundle.path(forResource: "Bus2", ofType: "json"), let data2 = try? Data.init(contentsOf: URL.init(fileURLWithPath: path2)) {
            let json1 = JSON(data: data1)
            let json2 = JSON(data: data2)
            let bus1 = BusDetail(json1, logoBaseURL: "busLogoBaseURL")
            let bus2 = BusDetail(json2, logoBaseURL: "busLogoBaseURL")
            
            XCTAssertNotEqual(bus1, bus2)
        } else {
            XCTFail("Error in reading file")
        }
    }
}
