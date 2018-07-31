//
//  FetchNewsServiceUnitTests.swift
//  CricketNewsUnitTests
//
//  Created by Anirudh Das on 7/6/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import XCTest
@testable import CricketNews

/**
 Unit Tests for Service Call
 */
class FetchNewsServiceUnitTests: XCTestCase {
    
    var fetchNewsService: CricbuzzServiceProtocol!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testCricbuzzAPIWithCorrectURLAndExpectationOfAllNewsAndDetailedURL() {
        fetchNewsService = CricbuzzService(apiURL: ServerConfiguration.apiCricbuzzNewsBaseUrl)
        let exp = expectation(description: "Array of News and detailed Url")
        fetchNewsService.fetchAllNews { (cricbuzzNews) in
            guard cricbuzzNews != nil else {
                 XCTFail("Webservice failed to respond with Array of News and Detailed URL in 30 seconds with CorrectURL")
                return
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testCricbuzzAPIWithIncorrectURL() {
        fetchNewsService = CricbuzzService(apiURL: "SomeIncorrectUrl")
        let exp = expectation(description: "No response")
        fetchNewsService.fetchAllNews { (cricbuzzNews) in
            guard cricbuzzNews == nil else {
                XCTFail("Webservice responded unexpectedly")
                return
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testMockCricbuzzAPIWithCorrectURLAndExpectationOfAllNewsAndDetailedURL() {
        fetchNewsService = MockCricbuzzService(apiURL: ServerConfiguration.apiCricbuzzNewsBaseUrl)
        let exp = expectation(description: "No response")
        fetchNewsService.fetchAllNews { (cricbuzzNews) in
            guard cricbuzzNews == nil else {
                XCTFail("Webservice responded unexpectedly")
                return
            }
            exp.fulfill()
        }
        waitForExpectations(timeout: 30, handler: nil)
    }
    
    func testCricbuzzAPIWithExpectedResponseTime() {
        fetchNewsService = CricbuzzService(apiURL: ServerConfiguration.apiCricbuzzNewsBaseUrl)
        let exp = expectation(description: "Response in 0.1 seconds")
        fetchNewsService.fetchAllNews { (cricbuzzNews) in
            guard cricbuzzNews != nil else {
                XCTFail("Webservice failed to respond in 0.1 seconds")
                return
            }
            exp.fulfill()
        }
        //Expected Response Time is 0.1 seconds
        waitForExpectations(timeout: 0.1, handler: nil)
    }
    
    func testPerformanceOfAPICall() {
        self.measure {
            // Put the code you want to measure the time of here.
            fetchNewsService = CricbuzzService(apiURL: ServerConfiguration.apiCricbuzzNewsBaseUrl)
            fetchNewsService.fetchAllNews { (cricbuzzNews) in
                
            }
        }
    }
}
