//
//  FetchBusesService.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 CricbuzzServiceProtocol for Mocking Service
 */
protocol FetchBusesProtocol {
    func fetchAllBuses(completionBlock: @escaping (_ response: [BusDetail]?) -> Void)
}

/**
 Handles the API calls and parses the Response
 */
class FetchBusesService: FetchBusesProtocol {
    func fetchAllBuses(completionBlock: @escaping (_ response: [BusDetail]?) -> Void) {
        AlamofireConfig.shared.manager.request(ServerConfiguration.apiRedBusFetchBusUrl)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success:
                    let json = JSON(data: response.data!)
                    //print("Response: \(json)")
                    guard json != JSON.null, let RIN = json["RIN"].array, !RIN.isEmpty else {
                        completionBlock(nil)
                        return
                    }
                    var busesList: [BusDetail] = []
                    let busLogoBaseURL: String? = json["blu"].string
                    RIN.forEach({ (item) in
                        if let InvList = item["InvList"].array {
                            for bus in InvList {
                                if let busDetail = BusDetail(bus, logoBaseURL: busLogoBaseURL) {
                                    busesList.append(busDetail)
                                }
                            }
                        }
                    })
                    completionBlock(busesList)
                case .failure(_):
                    completionBlock(nil)
                }
        }
    }
}
