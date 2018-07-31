//
//  PixlrImageUnitTests.swift
//  InfiniteScrollTests
//
//  Created by Anirudh Das on 7/7/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import XCTest
import SwiftyJSON
@testable import InfiniteScroll

// MARK: - Tests Init, Parsing and Equatable for PixlrImage
class PixlrImageUnitTests: XCTestCase {
    
    func testParsingLogicOfPixlrImageSuccess() {
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "ValidJSONData", ofType: "json"), let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
            let json = JSON(data: data)
            guard json != JSON.null, let hits = json["hits"].array, !hits.isEmpty else {
                return
            }
            
            for hit in hits {
                XCTAssertNotNil(PixlrImage(json: hit, pageNumber: 1), "Successful Parsing")
            }
            
        }
    }
    
    func testParsingLogicOfPixlrImageFailure() {
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "InValidJSONData", ofType: "json"), let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
            let json = JSON(data: data)
            guard json != JSON.null, let hits = json["hits"].array, !hits.isEmpty else {
                return
            }
            
            for hit in hits {
                XCTAssertNil(PixlrImage(json: hit, pageNumber: 1), "Successful Parsing")
            }
            
        }
    }
    
    func testInitPixlrImageWithValidParam() {
        let dict: [String: Any] = ["id": 1234, "webformatURL": "https://pixabay.com/get/ea30b0082af4073ed1584d05fb1d4f92eb73ebd01fac104496f0c87ea0efb5be_640.jpg",
        "previewURL": "https://cdn.pixabay.com/photo/2018/07/04/22/55/fantasy-3517206_150.jpg"]
        let json = JSON(parseJSON: dict.toJSONString())
        let image = PixlrImage(json: json, pageNumber: 1)
        
        XCTAssertNotNil(image, "Initialization Success")
        XCTAssertEqual(image?.id, dict["id"] as? Int)
    }
    
    func testInitPixlrImageWithInValidParam() {
        let dict: [String: Any] = ["id": 1234, "webURL": "https://pixabay.com/get/ea30b0082af4073ed1584d05fb1d4f92eb73ebd01fac104496f0c87ea0efb5be_640.jpg",
                                   "previewURL": "https://cdn.pixabay.com/photo/2018/07/04/22/55/fantasy-3517206_150.jpg"]
        let json = JSON(parseJSON: dict.toJSONString())
        let image = PixlrImage(json: json, pageNumber: 1)
        
        XCTAssertNil(image, "Initialization Failure")
    }
    
    func testEquatableReturnsTrue() {
        let dict: [String: Any] = ["id": 1234, "webformatURL": "https://pixabay.com/get/ea30b0082af4073ed1584d05fb1d4f92eb73ebd01fac104496f0c87ea0efb5be_640.jpg",
                                   "previewURL": "https://cdn.pixabay.com/photo/2018/07/04/22/55/fantasy-3517206_150.jpg"]
        let json = JSON(parseJSON: dict.toJSONString())
        let image1 = PixlrImage(json: json, pageNumber: 1)
        let image2 = PixlrImage(json: json, pageNumber: 1)
        
        XCTAssertEqual(image1, image2)
    }
    
    func testEquatableReturnsFalse() {
        let dict: [String: Any] = ["id": 1234, "webformatURL": "https://pixabay.com/get/ea30b0082af4073ed1584d05fb1d4f92eb73ebd01fac104496f0c87ea0efb5be_640.jpg",
                                   "previewURL": "https://cdn.pixabay.com/photo/2018/07/04/22/55/fantasy-3517206_150.jpg"]
        let json = JSON(parseJSON: dict.toJSONString())
        let image1 = PixlrImage(json: json, pageNumber: 1)
        let image2 = PixlrImage(json: json, pageNumber: 2)
        
        XCTAssertNotEqual(image1, image2)
    }
}
