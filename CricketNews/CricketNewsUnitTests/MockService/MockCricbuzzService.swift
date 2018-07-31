//
//  MockCricbuzzService.swift
//  CricketNewsUnitTests
//
//  Created by Anirudh Das on 7/6/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
@testable import CricketNews
import SwiftyJSON

/**
 Mocks the CricbuzzService implementation
 */
class MockCricbuzzService: CricbuzzServiceProtocol {
    var apiURL: String
    
    init(apiURL: String) {
        self.apiURL = apiURL
    }
    
    func fetchAllNews(completionBlock: @escaping (_ response: CricbuzzNewsResponse?) -> Void) {
        AlamofireConfig.shared.manager.request(apiURL)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success:
                    let json = JSON(data: response.data!)
                    guard json != JSON.null, let detailedURL = json["detailedURL"].string, let items = json["news_array"].array else { //Wrong Keys
                        completionBlock(nil)
                        return
                    }
                    var newsArray: [CricbuzzNews] = []
                    for item in items {
                        if let news = CricbuzzNews(item) {
                            newsArray.append(news)
                        }
                    }
                    guard !newsArray.isEmpty else {
                        completionBlock(nil)
                        return
                    }
                    completionBlock(CricbuzzNewsResponse(detailedBaseUrl: detailedURL, newsArray: newsArray))
                case .failure(_):
                    completionBlock(nil)
                }
        }
    }
    
    func fetchDetailedNews(detailUrl: String, completionBlock: @escaping (_ response: CricbuzzStory?) -> Void) {
        AlamofireConfig.shared.manager.request(detailUrl)
            .validate(statusCode: 400..<500) //Wrong Status Code
            .responseJSON { response in
                switch response.result {
                case .success:
                    let json = JSON(data: response.data!)
                    guard json != JSON.null, let story = CricbuzzStory(json) else {
                        completionBlock(nil)
                        return
                    }
                    completionBlock(story)
                case .failure(_):
                    completionBlock(nil)
                }
        }
    }
}
