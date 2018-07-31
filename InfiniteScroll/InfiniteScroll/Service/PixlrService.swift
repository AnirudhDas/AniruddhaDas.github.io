//
//  PixlrService.swift
//  InfiniteScroll
//
//  Created by Anirudh Das on 7/6/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

/**
 PixlrServiceProtocol for Mocking Service
 */
protocol PixlrServiceProtocol {
    func fetchImagesForPage(pageNumber: Int, completionBlock: @escaping (_ response: [PixlrImage]?) -> Void) -> DataRequest?
}

/**
 Handles the API calls and parses the Response
 */
class PixlrService: PixlrServiceProtocol {
    var apiURL: String
    
    init(apiURL: String) {
        self.apiURL = apiURL
    }
    
    func fetchImagesForPage(pageNumber: Int, completionBlock: @escaping (_ response: [PixlrImage]?) -> Void) -> DataRequest? {
        let paramDict: [String: String] = [
            "key": ServerConfiguration.apiKey,
            "image_type": ServerConfiguration.imageType,
            "page": "\(pageNumber)",
            "per_page": "\(ServerConfiguration.imagesPerPage)"
        ]
        
        let encodedURLString = Utility.addURLEncoding(apiURL + Utility.generateQueryString(paramDict))
        //print(encodedURLString)
        
        return AlamofireConfig.shared.manager.request(encodedURLString)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                    case .success:
                        let json = JSON(data: response.data!)
                        //print(json)
                        guard json != JSON.null, let hits = json["hits"].array else {
                            completionBlock(nil)
                            return
                        }
                        var pixlrImageArray: [PixlrImage] = []
                        for hit in hits {
                            if let pixlrImage = PixlrImage(json: hit, pageNumber: pageNumber) {
                                pixlrImageArray.append(pixlrImage)
                            }
                        }
                        guard !pixlrImageArray.isEmpty else {
                            completionBlock(nil)
                            return
                        }
                        completionBlock(pixlrImageArray)
                    case .failure(_):
                        completionBlock(nil)
                }
        }
    }
}
