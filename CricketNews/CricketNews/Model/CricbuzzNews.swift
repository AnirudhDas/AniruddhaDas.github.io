//
//  CricbuzzNews.swift
//  CricketNews
//
//  Created by Anirudh Das on 7/5/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct CricbuzzNews {
    public var id: String
    public var headline: String
    public var imageLink: String?
    
    public init?(_ json: JSON) {
        guard let id = json["id"].string, let headline = json["headline"].string else {
            return nil
        }
        self.id = id
        self.headline = headline
        self.imageLink = json["image"].string
    }
}
