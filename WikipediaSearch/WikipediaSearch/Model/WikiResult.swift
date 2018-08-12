//
//  WikiResult.swift
//  WikipediaSearch
//
//  Created by Anirudh Das on 8/11/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import SwiftyJSON

public class WikiResult: NSObject, NSCoding {
    
    var pageId: Int
    var title: String
    var imageSource: String?
    var wikiDescription: String?
    
    init(pageId: Int, title: String, imageSource: String?, descriptionArray: [JSON]?) {
        self.pageId = pageId
        self.title = title
        self.imageSource = imageSource
        if let descriptionArray = descriptionArray, !descriptionArray.isEmpty {
            self.wikiDescription = descriptionArray[0].string ?? ""
        } else {
            self.wikiDescription = ""
        }
    }
    
    //NSCoding Protocol Conformance to save this object in UserDefaults
    required public init(coder decoder: NSCoder) {
        self.pageId = decoder.decodeInteger(forKey: "pageId")
        self.title = decoder.decodeObject(forKey: "title") as? String ?? ""
        self.imageSource = decoder.decodeObject(forKey: "imageSource") as? String
        self.wikiDescription = decoder.decodeObject(forKey: "wikiDescription") as? String
    }
    
    public func encode(with coder: NSCoder) {
        coder.encode(self.pageId, forKey: "pageId")
        coder.encode(self.title, forKey: "title")
        coder.encode(self.imageSource, forKey: "imageSource")
        coder.encode(self.wikiDescription, forKey: "wikiDescription")
    }
}

//Equatable Protocol Conformance
public func ==(lhs: WikiResult, rhs: WikiResult) -> Bool {
    return lhs.pageId == rhs.pageId
}
