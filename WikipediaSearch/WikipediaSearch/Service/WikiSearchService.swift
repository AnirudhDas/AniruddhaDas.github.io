//
//  WikiSearchService.swift
//  WikipediaSearch
//
//  Created by Anirudh Das on 8/11/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

protocol WikiSearchServiceProtocol {
    func fetchResults(filter: String, completionHandler: @escaping (_ userArray: [WikiResult]?) -> Void) -> DataRequest?
}

class WikiSearchService: WikiSearchServiceProtocol {
    func fetchResults(filter: String, completionHandler: @escaping ([WikiResult]?) -> Void) -> DataRequest? {
        guard let urlString = Utility.addURLEncoding(ServerConfiguration.getWikiAPIUrl(filter: filter)) else {
            completionHandler(nil)
            return nil
        }
        //print("URL: \(urlString)")
        return AlamofireConfig.shared.manager.request(urlString)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success:
                    let json = JSON(response.data!)
                    //print("Response: \(json)")
                    guard json != JSON.null, let queryDict = json["query"].dictionary, let pagesArray = queryDict["pages"]?.array else {
                        completionHandler(nil)
                        return
                    }
                    var results: [WikiResult] = []
                    for page in pagesArray {
                        if let pageId = page["pageid"].int, let title = page["title"].string {
                            results.append(WikiResult(pageId: pageId, title: title, imageSource: page["thumbnail"].dictionary?["source"]?.string, descriptionArray: page["terms"].dictionary?["description"]?.array))
                        }
                    }
                    completionHandler(results)
                case .failure(_):
                    completionHandler(nil)
                }
        }
    }
}
