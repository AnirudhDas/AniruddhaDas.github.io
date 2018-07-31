//
//  ViewController.swift
//  MVVMDataBindingRestAPICall
//
//  Created by Anirudh Das on 7/26/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

class MoviesViewController: UIViewController {

    //var moviesViewModel: MoviesViewModelProtocol! = MoviesViewModel()
    
    @IBOutlet weak var moviesViewModel: MoviesViewModel! //Dependency Injected from Storyboard
    @IBOutlet weak var moviesTableView: UITableView!
    @IBOutlet weak var movieTxtFld: UITextField!
    @IBOutlet weak var addBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        
        /*
        moviesViewModel.fetchMovies {
            DispatchQueue.main.async {
                self.moviesTableView.reloadData()
            }
        }
        */
        
        moviesViewModel.reloadMoviesTableView = {
            DispatchQueue.main.async {
                self.moviesTableView.reloadData()
            }
        }
        
        moviesViewModel.fetchMovies()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func addMovieClicked(_ sender: UIButton) {
        if !(movieTxtFld.text?.isEmpty)! {
            moviesViewModel.addMovie(name: movieTxtFld.text!)
            movieTxtFld.text = ""
            self.view.endEditing(true)
        }
    }
}

extension MoviesViewController: UITableViewDelegate, UITableViewDataSource {
    func setupTableView()  {
        self.moviesTableView.dataSource = self
        self.moviesTableView.delegate = self
        self.moviesTableView.tableFooterView = UIView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return moviesViewModel?.moviesArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let movieCell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        movieCell.configureMovieCell(movie: moviesViewModel.moviesArray[indexPath.row])
        return movieCell
    }
}
