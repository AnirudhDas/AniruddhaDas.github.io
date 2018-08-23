//
//  ServerConfiguration.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import UIKit

/**
 Defines all BaseURLs
 */
public struct ServerConfiguration {
    struct Request {
        static let apiBaseURL = "https://api.myjson.com"
        static let apiPathURL = "/bins/12l8sb"
        
        static var apiFetchBusUrl: String {
            return apiBaseURL + apiPathURL
        }
    }
    
    struct Response {
        static let rin = "RIN"
        static let blu = "blu"
        static let invList = "InvList"
        static let rid = "rid"
        static let tvs = "Tvs"
        static let src = "src"
        static let dst = "dst"
        static let minfr = "minfr"
        static let cur = "cur"
        static let dt = "dt"
        static let bc = "Bc"
        static let isAc = "IsAc"
        static let isNonAc = "IsNonAc"
        static let isSeater = "IsSeater"
        static let isSleeper = "IsSleeper"
        static let at = "at"
        static let lp = "lp"
        static let oprt = "oprt"
        static let totRt = "totRt"
        static let dateFormat = "dd/MM/yyyy hh:mm:ss a"
    }
}
