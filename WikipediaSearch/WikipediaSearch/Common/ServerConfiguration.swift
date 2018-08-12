//
//  ServerConfiguration.swift
//  WikipediaSearch
//
//  Created by Anirudh Das on 8/11/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation

protocol ServerConfigurationProtocol {
    func getWikiAPIUrl(filter: String) -> String
    func getWikiPageUrl(title: String) -> String
}

public struct ServerConfiguration {
    private static var wikiAPIBaseUrl: String = "https://en.wikipedia.org//w/api.php"
    private static var wikiPageBaseUrl: String = "https://en.wikipedia.org/wiki/"
    
    public static func getWikiAPIUrl(filter: String) -> String {
        
        let paramDict: [String: String] = [
            "action": "query",
            "format": "json",
            "prop": "pageimages|pageterms",
            "generator": "prefixsearch",
            "redirects": "1",
            "formatversion": "2",
            "piprop": "thumbnail",
            "pithumbsize": "50",
            "pilimit": "10",
            "wbptterms": "description",
            "gpslimit": "10",
            "gpssearch": "\(filter)"
        ]
        
        return wikiAPIBaseUrl + Utility.generateQueryString(paramDict)
    }
    
    public static func getWikiPageUrl(title: String) -> String {
        return wikiPageBaseUrl + title
    }
}
