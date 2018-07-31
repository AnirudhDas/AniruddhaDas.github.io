//
//  CricbuzzNewsResponse.swift
//  CricketNews
//
//  Created by Anirudh Das on 7/5/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation

public struct CricbuzzNewsResponse {
    public var detailedBaseUrl: String
    public var newsArray: [CricbuzzNews]
    
    public init(detailedBaseUrl: String, newsArray: [CricbuzzNews]) {
        self.detailedBaseUrl = detailedBaseUrl
        self.newsArray = newsArray
    }
}
