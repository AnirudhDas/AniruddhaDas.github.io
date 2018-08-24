//
//  BusDetail.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct BusType {
    var isAc: Bool
    var isNonAc: Bool
    var isSeater: Bool
    var isSleeper: Bool
    
    init(isAc: Bool, isNonAc: Bool, isSeater: Bool, isSleeper: Bool) {
        self.isAc = isAc
        self.isNonAc = isNonAc
        self.isSeater = isSeater
        self.isSleeper = isSleeper
    }
}

public struct BusDetail: Equatable, Hashable {
    
    let busId: Int
    let source: String
    let destination: String
    let departureTime: Double
    let arrivalTime: Double
    let operatorName: String
    let rating: Double
    let busLogoURL: String
    let fare: Double
    let currency: String
    let busType: BusType
    
    public var hashValue: Int {
        return busId
    }
    
    public init?(_ json: JSON, logoBaseURL: String?) {
        guard let busId = json[ServerConfiguration.Response.rid].int, let source = json[ServerConfiguration.Response.src].string, let destination = json[ServerConfiguration.Response.dst].string, let departureTime = json[ServerConfiguration.Response.dt].string?.toDate(format: ServerConfiguration.Response.dateFormat)?.millisecondsSince1970, let operatorName = json[ServerConfiguration.Response.tvs].string, let busCategory = json[ServerConfiguration.Response.bc].dictionary, let isAC = busCategory[ServerConfiguration.Response.isAc]?.bool, let isNONAC = busCategory[ServerConfiguration.Response.isNonAc]?.bool, let isSEATER = busCategory[ServerConfiguration.Response.isSeater]?.bool, let isSLEEPER = busCategory[ServerConfiguration.Response.isSleeper]?.bool, let fare = json[ServerConfiguration.Response.minfr].double, let currency = json[ServerConfiguration.Response.cur].string else {
            return nil
        }
        self.busId = busId
        self.source = source
        self.destination = destination
        self.departureTime = departureTime
        if let arrivalTime = json[ServerConfiguration.Response.at].string?.toDate(format: ServerConfiguration.Response.dateFormat)?.millisecondsSince1970 {
            self.arrivalTime = arrivalTime
        } else {
            self.arrivalTime = -1
        }
        self.operatorName = operatorName
        if let ratingStr = json[ServerConfiguration.Response.oprt].dictionary?[ServerConfiguration.Response.totRt]?.string, let ratingDouble = Double(ratingStr) {
            self.rating = ratingDouble
        } else {
            self.rating = -1
        }
        if let logoEndPoint = json[ServerConfiguration.Response.lp].string, let logoBaseURL = logoBaseURL, !logoBaseURL.isEmpty {
            self.busLogoURL = logoBaseURL + logoEndPoint
        } else {
            self.busLogoURL = ""
        }
        self.fare = fare
        self.currency = currency
        self.busType = BusType(isAc: isAC, isNonAc: isNONAC, isSeater: isSEATER, isSleeper: isSLEEPER)
    }
    
    public static func ==(lhs: BusDetail, rhs: BusDetail) -> Bool {
        return lhs.busId == rhs.busId
    }
}
