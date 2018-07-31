//
//  NewsViewController.swift
//  CricketNews
//
//  Created by Anirudh Das on 7/5/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit
import SwiftSpinner

/**
 Shows all the news from Cricbuzz.
 */
class NewsViewController: UIViewController {

    @IBOutlet weak var retryBtn: UIButton!
    @IBOutlet weak var newsTableView: UITableView!
    var fetchNewsService: CricbuzzServiceProtocol!
    var cricbuzzNews: CricbuzzNewsResponse!
    
    let refreshControl = UIRefreshControl()
    
    //Custom 3D Animations Properties
    let customNavigationAnimationController = CustomNavigationAnimationController()
    //let customInteractionController = CustomInteractionController()
    
    //Inject dependencies
    convenience init(fetchNewsService: CricbuzzServiceProtocol) {
        self.init()
        self.fetchNewsService = fetchNewsService
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //For custom animations
        navigationController?.delegate = self
        
        //Just incase this VC is initialized via Storyboard.
        if fetchNewsService == nil {
            fetchNewsService = CricbuzzService(apiURL: ServerConfiguration.apiCricbuzzNewsBaseUrl)
        }
        
        title = Constants.newsHomeNavTitle
        configureView()
        fetchNews()
    }
    
    func configureView() {
        newsTableView.showsHorizontalScrollIndicator = false
        newsTableView.showsVerticalScrollIndicator = false
        
        refreshControl.backgroundColor = UIColor.clear
        refreshControl.addTarget(self, action: #selector(self.pullToRefresh), for: UIControlEvents.valueChanged)
        newsTableView.addSubview(refreshControl)
    }
    
    @objc func pullToRefresh() {
        refreshControl.endRefreshing()
        fetchNews()
    }
    
    @IBAction func retryBtnTapped(_ sender: UIButton) {
        fetchNews()
    }
    
    /**
     Fetch all news from server and setup views accordingly.
     */
    @objc func fetchNews() {
        retryBtn.isHidden = true
        newsTableView.isHidden = true
        
        SwiftSpinner.show(delay: 0.3, title: Constants.spinnerMessage)
        fetchNewsService.fetchAllNews { [weak self] (cricbuzzNews) in
            SwiftSpinner.hide()
            guard let weakSelf = self, let cricbuzzNews = cricbuzzNews else {
                self?.retryBtn.isHidden = false
                return
            }
            
            weakSelf.cricbuzzNews = cricbuzzNews
            weakSelf.newsTableView.isHidden = false
            weakSelf.newsTableView.reloadData()
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK:- UITableViewDelegate, UITableViewDataSource

extension NewsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cricbuzzNews?.newsArray.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let newsCell = tableView.dequeueReusableCell(withIdentifier: Constants.newsCell, for: indexPath) as? NewsTableViewCell else {
            return UITableViewCell()
        }
        
        newsCell.configureNewsCell(detailedBaseUrl: cricbuzzNews.detailedBaseUrl, news: cricbuzzNews.newsArray[indexPath.row])
        newsCell.accessoryType = .disclosureIndicator
        newsCell.selectionStyle = .none
        return newsCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let newsCell = tableView.cellForRow(at: indexPath) as? NewsTableViewCell, let detailUrl = newsCell.detailUrl else {
            return
        }
        self.performSegue(withIdentifier: Constants.detailStory, sender: detailUrl)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.detailStory, let destinationVC = segue.destination as? DetailStoryViewController, let detailUrl = sender as? String {
            //Inject dependencies
            destinationVC.setupWith(detailUrl: detailUrl, fetchNewsService: fetchNewsService)
        }
    }
}

// MARK:- UIViewControllerTransitioningDelegate, UINavigationControllerDelegate - For custom animations

extension NewsViewController: UIViewControllerTransitioningDelegate, UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        /*
        if operation == .push {
            customInteractionController.attachToViewController(viewController: toVC)
        }
        */
        customNavigationAnimationController.reverse = operation == .pop
        return customNavigationAnimationController
    }
    
    /*
    func navigationController(navigationController: UINavigationController, interactionControllerForAnimationController animationController: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        return customInteractionController.transitionInProgress ? customInteractionController : nil
    }
    */
}
