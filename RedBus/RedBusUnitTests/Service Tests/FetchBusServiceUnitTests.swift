//
//  FetchBusServiceUnitTests.swift
//  RedBusUnitTests
//
//  Created by Anirudh Das on 8/24/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import XCTest
@testable import RedBus

/**
 Unit Tests for Service Call
 */
class FetchBusServiceUnitTests: XCTestCase {
    var fetchBusesService: FetchBusesProtocol!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testFetchBusesServiceWithCorrectURL() {
        fetchBusesService = FetchBusesService(apiURL: ServerConfiguration.Request.apiFetchBusUrl)
        let exp = expectation(description: "Array of Buses")
        
        _ = fetchBusesService.fetchAllBuses { (busesList) in
            guard let busesList = busesList, !busesList.isEmpty else {
                XCTFail("Service failed to respond with Array of Buses in 30 seconds")
                return
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testFetchBusesServiceWithIncorrectURL() {
        fetchBusesService = FetchBusesService(apiURL: "Some Incorrect URL")
        let exp = expectation(description: "No response")
        _ = fetchBusesService.fetchAllBuses { (busesList) in
            guard busesList == nil else {
                XCTFail("Service responded unexpectedly")
                return
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testJSONParsingUsingMockService() {
        fetchBusesService = MockFetchBusesService(apiURL: ServerConfiguration.Request.apiFetchBusUrl)
        let exp = expectation(description: "Successful response of Buses Response")
        _ = fetchBusesService.fetchAllBuses { (busesList) in
            guard let busesList = busesList, !busesList.isEmpty else {
                XCTFail("No Response")
                return
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testFetchBusesServiceWithExpectedResponseTime() {
        fetchBusesService = FetchBusesService(apiURL: ServerConfiguration.Request.apiFetchBusUrl)
        let start = DispatchTime.now()
        _ = fetchBusesService.fetchAllBuses { (busesList) in
            let end = DispatchTime.now()
            let nanoTime = end.uptimeNanoseconds - start.uptimeNanoseconds
            let timeInterval = Double(nanoTime) / 1_000_000_000
            guard timeInterval > 1 else {
                XCTFail("Responsed less than a second")
                return
            }
            print("Took more than 1 second")
        }
    }
    
    func testPerformanceOfPixlrService() {
        self.measure {
            // Put the code you want to measure the time of here.
            fetchBusesService = FetchBusesService(apiURL: ServerConfiguration.Request.apiFetchBusUrl)
            _ = fetchBusesService.fetchAllBuses { (_) in
            }
        }
    }
    
}
