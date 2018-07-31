//
//  CricbuzzStory.swift
//  CricketNews
//
//  Created by Anirudh Das on 7/5/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import SwiftyJSON

public struct CricbuzzStory {
    public var headline: String
    public var summary: String
    public var contentsArray: [String] = []
    public var imageLinksArray: [String] = []
    
    public init?(_ json: JSON) {
        guard let newsInfo = json["news_info"].dictionary, let headline = newsInfo["headline"]?.string, let summary = newsInfo["summary"]?.string else {
            return nil
        }
        self.headline = headline
        self.summary = summary
        
        if let contents = json["content"].array {
            for item in contents {
                if let type = item["type"].string, type == "text", let content = item["content"].string {
                    self.contentsArray.append(content)
                }
            }
        }
        
        if let imageUrl = json["image_url"].string, let images = json["images"].array {
            for item in images {
                if let url = item["url"].string {
                    self.imageLinksArray.append(imageUrl + "\(url)")
                }
            }
        }
    }
}
