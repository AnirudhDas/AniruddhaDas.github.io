//
//  PixlrServiceUnitTests.swift
//  InfiniteScrollTests
//
//  Created by Anirudh Das on 7/6/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import XCTest
@testable import InfiniteScroll

/**
 Unit Tests for Service Call
 */
class PixlrServiceUnitTests: XCTestCase {
    
    var pixlrService: PixlrServiceProtocol!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPixlrServiceWithCorrectURL() {
        pixlrService = PixlrService(apiURL: ServerConfiguration.apiBaseUrl)
        let exp = expectation(description: "Array of 20 Pixlr Images")
        _ = pixlrService.fetchImagesForPage(pageNumber: 1, completionBlock: { (pixlrImageArray) in
            guard let pixlrImageArray = pixlrImageArray, pixlrImageArray.count == 20 else {
                XCTFail("Webservice failed to respond with Array of 20 Pixlr Images in 30 seconds")
                return
            }
            exp.fulfill()
        })
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testPixlrServiceWithInvalidPageNumber() {
        pixlrService = PixlrService(apiURL: ServerConfiguration.apiBaseUrl)
        let exp = expectation(description: "No response")
        _ = pixlrService.fetchImagesForPage(pageNumber: 0, completionBlock: { (pixlrImageArray) in
            guard pixlrImageArray == nil else {
                XCTFail("Webservice responded unexpectedly")
                return
            }
            exp.fulfill()
        })
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testPixlrServiceWithIncorrectURL() {
        pixlrService = PixlrService(apiURL: "Some Incorrect URL")
        let exp = expectation(description: "No response")
        _ = pixlrService.fetchImagesForPage(pageNumber: 1, completionBlock: { (pixlrImageArray) in
            guard pixlrImageArray == nil else {
                XCTFail("Webservice responded unexpectedly")
                return
            }
            exp.fulfill()
        })
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testJSONParsingUsingMockService() {
        pixlrService = MockPixlrService(apiURL: ServerConfiguration.apiBaseUrl)
        let exp = expectation(description: "Successful response of pixlrImageArray")
        _ = pixlrService.fetchImagesForPage(pageNumber: 1, completionBlock: { (pixlrImageArray) in
            guard pixlrImageArray != nil else {
                XCTFail("No Response")
                return
            }
            exp.fulfill()
        })
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testPixlrServiceWithExpectedResponseTime() {
        pixlrService = MockPixlrService(apiURL: ServerConfiguration.apiBaseUrl)
        let exp = expectation(description: "Successful response of pixlrImageArray in 0.1 seconds")
        _ = pixlrService.fetchImagesForPage(pageNumber: 1, completionBlock: { (pixlrImageArray) in
            guard pixlrImageArray != nil else {
                XCTFail("No Response")
                return
            }
            exp.fulfill()
        })
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func testPerformanceOfPixlrService() {
        self.measure {
            // Put the code you want to measure the time of here.
            pixlrService = MockPixlrService(apiURL: ServerConfiguration.apiBaseUrl)
            _ = pixlrService.fetchImagesForPage(pageNumber: 1, completionBlock: { (_) in
                
            })
        }
    }
}
