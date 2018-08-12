//
//  AlamofireConfig.swift
//  WikipediaSearch
//
//  Created by Anirudh Das on 8/11/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import Alamofire

final class AlamofireConfig {
    static let shared = AlamofireConfig()
    let manager: Alamofire.SessionManager
    
    private init() {
        manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
    }
}
