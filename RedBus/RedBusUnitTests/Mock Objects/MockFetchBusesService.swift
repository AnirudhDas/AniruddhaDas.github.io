//
//  MockFetchBusesService.swift
//  RedBusUnitTests
//
//  Created by Anirudh Das on 8/24/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
@testable import RedBus

/**
 Reads JSON data from a local file and mocks the API call.
 */
class MockFetchBusesService: FetchBusesProtocol {
    var apiURL: String
    
    init(apiURL: String) {
        self.apiURL = apiURL
    }
    
    func fetchAllBuses(completionBlock: @escaping ([BusDetail]?) -> Void) -> DataRequest? {
        
        let bundle = Bundle(for: type(of: self))
        if let path = bundle.path(forResource: "ValidJSONData", ofType: "json") {
            if let data = try? Data.init(contentsOf: URL.init(fileURLWithPath: path)) {
                let json = JSON(data: data)
                //print("Response: \(json)")
                guard json != JSON.null, let RIN = json[ServerConfiguration.Response.rin].array, !RIN.isEmpty else {
                    completionBlock(nil)
                    return nil
                }
                var busesList: [BusDetail] = []
                let busLogoBaseURL: String? = json[ServerConfiguration.Response.blu].string
                RIN.forEach({ (item) in
                    if let InvList = item[ServerConfiguration.Response.invList].array {
                        for bus in InvList {
                            if let busDetail = BusDetail(bus, logoBaseURL: busLogoBaseURL) {
                                busesList.append(busDetail)
                            }
                        }
                    }
                })
                completionBlock(busesList)
                return nil
            } else {
                completionBlock(nil)
                return nil
            }
        } else {
            completionBlock(nil)
            return nil
        }
    }
}
