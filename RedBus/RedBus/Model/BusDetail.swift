//
//  BusDetail.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct BusDetail: Equatable, Hashable {
    public var source: String
    public var destination: String
    public var departureTime: Double
    public var arrivalTime: Double
    public var operatorName: String
    public var rating: Double
    public var busLogoURL: String
    public var isAC: Bool
    public var isNONAC: Bool
    public var isSEATER: Bool
    public var isSLEEPER: Bool
    public var fare: Double
    public var currency: String
    
    public var hashValue: Int {
        get {
            return "\(source.hashValue)\(destination.hashValue)\(departureTime.hashValue)\(operatorName.hashValue)\(fare.hashValue)\(currency.hashValue)".hashValue
        }
    }
    
    public init?(_ json: JSON, logoBaseURL: String?) {
        guard let source = json["src"].string, let destination = json["dst"].string, let departureTime = json["dt"].string?.toDate(format: "dd/MM/yyyy hh:mm:ss a")?.millisecondsSince1970, let operatorName = json["Tvs"].string, let busCategory = json["Bc"].dictionary, let isAC = busCategory["IsAc"]?.bool, let isNONAC = busCategory["IsNonAc"]?.bool, let isSEATER = busCategory["IsSeater"]?.bool, let isSLEEPER = busCategory["IsSleeper"]?.bool, let fare = json["minfr"].double, let currency = json["cur"].string else {
            return nil
        }
        
        self.source = source
        self.destination = destination
        self.departureTime = departureTime
        if let arrivalTime = json["at"].string?.toDate(format: "dd/MM/yyyy hh:mm:ss a")?.millisecondsSince1970 {
            self.arrivalTime = arrivalTime
        } else {
            self.arrivalTime = 0
        }
        self.operatorName = operatorName
        if let ratingStr = json["oprt"].dictionary?["totRt"]?.string, let ratingDouble = Double(ratingStr) {
            self.rating = ratingDouble
        } else {
            self.rating = 0
        }
        if let logoEndPoint = json["lp"].string, let logoBaseURL = logoBaseURL, !logoBaseURL.isEmpty {
            self.busLogoURL = logoBaseURL + logoEndPoint
        } else {
            self.busLogoURL = ""
        }
        self.isAC = isAC
        self.isNONAC = isNONAC
        self.isSEATER = isSEATER
        self.isSLEEPER = isSLEEPER
        self.fare = fare
        self.currency = currency
    }
}
