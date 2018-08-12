//
//  SessionManager.swift
//  WikipediaSearch
//
//  Created by Anirudh Das on 8/11/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation

public protocol SessionManaging {
    static func addRecentSearch(searchResult: WikiResult)
    static func getRecentSearch() -> [WikiResult]
}

open class SessionManager: NSObject, SessionManaging {
    open static func addRecentSearch(searchResult: WikiResult) {
        var recentResults: [WikiResult] = getRecentSearch()
        if (!recentResults.contains(where: { result in result == searchResult })) {
            if(recentResults.count >= 4) {
                recentResults.removeLast()
            }
            recentResults.insert(searchResult, at: 0)
        }
        saveRecentResults(recentResults: recentResults)
    }
    
    open static func getRecentSearch() -> [WikiResult] {
        guard let data = UserDefaults.standard.data(forKey: Constants.KEY_RECENT_SEARCH), let recentResultsArray = NSKeyedUnarchiver.unarchiveObject(with: data) as? [WikiResult], !recentResultsArray.isEmpty else {
            return []
        }
        return recentResultsArray
    }
    
    fileprivate static func saveRecentResults(recentResults: [WikiResult]) {
        let encodedData = NSKeyedArchiver.archivedData(withRootObject: recentResults)
        UserDefaults.standard.set(encodedData, forKey: Constants.KEY_RECENT_SEARCH)
        UserDefaults.standard.synchronize()
    }
}
