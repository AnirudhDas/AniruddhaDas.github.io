//
//  FetchMoviesService.swift
//  MVVMDataBindingRestAPICall
//
//  Created by Anirudh Das on 7/26/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation

protocol MoviesProtocol {
    func fetchMovies(completionBlock: @escaping (_ movies: [Movie]?) -> Void)
}

class MoviesService: NSObject, MoviesProtocol {
    func fetchMovies(completionBlock: @escaping (_ movies: [Movie]?) -> Void) {
        
        let url: URL = URL(string: "https://itunes.apple.com/us/rss/topmovies/limit=25/json")!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if error == nil, let data = data, let json = try? JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any], let feedDict = json?["feed"] as? [String: Any], let entryArray = feedDict["entry"] as? [[String: Any]] {
                var movies: [Movie] = []
                for item in entryArray {
                    if let name = item["im:name"] as? [String: Any], let label = name["label"] as? String {
                        movies.append(Movie(name: label))
                    }
                }
                completionBlock(movies)
            } else {
                completionBlock(nil)
            }
        }.resume()
    }
}
