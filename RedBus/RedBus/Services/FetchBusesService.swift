//
//  FetchBusesService.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import SwiftyJSON

protocol FetchBusesProtocol {
    func fetchAllBuses(completionBlock: @escaping (_ response: [BusDetail]?) -> Void)
}

/**
 Fetches response and parses response
 */
class FetchBusesService: FetchBusesProtocol {
    func fetchAllBuses(completionBlock: @escaping (_ response: [BusDetail]?) -> Void) {
        AlamofireConfig.shared.manager.request(ServerConfiguration.Request.apiFetchBusUrl)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                    case .success:
                        let json = JSON(data: response.data!)
                        //print("Response: \(json)")
                        guard json != JSON.null, let RIN = json[ServerConfiguration.Response.rin].array, !RIN.isEmpty else {
                            completionBlock(nil)
                            return
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
                    case .failure(_):
                        completionBlock(nil)
                }
        }
    }
}
