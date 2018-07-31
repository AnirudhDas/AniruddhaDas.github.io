//
//  MoviesViewModel.swift
//  MVVMDataBindingRestAPICall
//
//  Created by Anirudh Das on 7/26/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation

protocol MoviesViewModelProtocol {
    func fetchMovies()
    func addMovie(name: String)
}

class MoviesViewModel: NSObject, MoviesViewModelProtocol {
    //var movieService: MoviesProtocol! = MoviesService()
    
    @IBOutlet weak var movieService: MoviesService! //Dependency Injected from Storyboard
    
    //var moviesArray: [Movie] = []
    
    var moviesArray : [Movie] = [] {
        didSet {
            reloadMoviesTableView()
        }
    }
    
    var reloadMoviesTableView = { () -> () in }
    
    /*
    func fetchMovies(completion: @escaping () -> ()) {
        movieService.fetchMovies { [weak self] (movies) in
            if let movies = movies {
                self?.movies = movies
                completion()
            }
        }
    }
    */
    
    func fetchMovies() {
        movieService.fetchMovies { [weak self] (movies) in
            if let movies = movies {
                self?.moviesArray = movies
                self?.reloadMoviesTableView()
            }
        }
    }
    
    func addMovie(name: String) {
        moviesArray.append(Movie(name: name))
    }
}
