//
//  CoreDataUnitTests.swift
//  RedBusUnitTests
//
//  Created by Anirudh Das on 8/24/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import XCTest
import CoreData
import SwiftyJSON
@testable import RedBus

class CoreDataUnitTests: XCTestCase {
    var dataController: DataController!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        dataController = appDelegate.dataController
        dataController.cleanUpCoreData()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDoesBusExistsBeforeBooking() {
        XCTAssertEqual(0, dataController.getAllBookings().count)
    }
    
    func testDoesBusExistsAfterBooking() {
        let bundle = Bundle(for: type(of: self))
        guard let path1 = bundle.path(forResource: "Bus1", ofType: "json"), let data1 = try? Data.init(contentsOf: URL.init(fileURLWithPath: path1)) else {
            return
        }
        let json1 = JSON(data: data1)
        let bus1: BusDetail! = BusDetail(json1, logoBaseURL: "busLogoBaseURL")
        dataController.addBooking(bus: bus1)
        XCTAssertNotNil(dataController.getBus(bus: bus1))
        XCTAssertGreaterThan(dataController.getAllBookings().count, 0)
    }
    
    func testDoesChangeRating() {
        let bundle = Bundle(for: type(of: self))
        guard let path1 = bundle.path(forResource: "Bus1", ofType: "json"), let data1 = try? Data.init(contentsOf: URL.init(fileURLWithPath: path1)) else {
            return
        }
        let json1 = JSON(data: data1)
        let bus1: BusDetail! = BusDetail(json1, logoBaseURL: "busLogoBaseURL")
        dataController.addBooking(bus: bus1)
        XCTAssertNotNil(dataController.getBus(bus: bus1))
        guard let bus = dataController.getBus(bus: bus1) else {
            return
        }
        dataController.updateBooking(bus: bus, rating: 4)
        
        guard let updatedBus = dataController.getBus(bus: bus1) else {
            return
        }
        XCTAssertEqual(4.0, updatedBus.rating)
    }
    
    func testDoesCancelBooking() {
        let bundle = Bundle(for: type(of: self))
        guard let path1 = bundle.path(forResource: "Bus1", ofType: "json"), let data1 = try? Data.init(contentsOf: URL.init(fileURLWithPath: path1)) else {
            return
        }
        let json1 = JSON(data: data1)
        let bus1: BusDetail! = BusDetail(json1, logoBaseURL: "busLogoBaseURL")
        dataController.addBooking(bus: bus1)
        XCTAssertNotNil(dataController.getBus(bus: bus1))
        guard let bus = dataController.getBus(bus: bus1) else {
            return
        }
        dataController.deleteBooking(bus: bus)
        XCTAssertNil(dataController.getBus(bus: bus1))
    }
}
