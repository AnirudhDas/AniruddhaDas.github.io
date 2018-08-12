//
//  WikiViewModel.swift
//  WikipediaSearch
//
//  Created by Anirudh Das on 8/11/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import Alamofire

protocol WikiViewModelProtocol {
    func fetchWikiResults(filter: String)
}

class WikiViewModel: NSObject, WikiViewModelProtocol {
    var wikiService: WikiSearchServiceProtocol = WikiSearchService()
    var request: DataRequest?
    var reloadWikiTableView = { () -> () in }
    
    //Data Binding
    var wikiResultsArray : [WikiResult] = SessionManager.getRecentSearch() {
        didSet {
            reloadWikiTableView()
        }
    }
    
    func fetchWikiResults(filter: String) {
        //If no filter, clear the data.
        guard !filter.isEmpty else {
            wikiResultsArray = SessionManager.getRecentSearch()
            reloadWikiTableView()
            return
        }
        
        //If ongoing request, cancel it.
        if let request = request {
            request.cancel()
        }
        
        request = wikiService.fetchResults(filter: filter, completionHandler: { [weak self] (wikiResultsArray) in
            guard let weakSelf = self else {
                return
            }
            if let wikiResultsArray = wikiResultsArray {
                weakSelf.wikiResultsArray = wikiResultsArray
                weakSelf.reloadWikiTableView()
            }
            weakSelf.request = nil
        })
    }
}
