//
//  DetailStoryViewController.swift
//  CricketNews
//
//  Created by Anirudh Das on 7/5/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit
import SwiftSpinner

/**
 Shows the detailed story for a selected news.
 */
class DetailStoryViewController: UIViewController {

    var detailUrl: String!
    var fetchNewsService: CricbuzzServiceProtocol!
    var cricbuzzDetailedStory: CricbuzzStory!
    
    
    @IBOutlet weak var retryBtn: UIButton!
    @IBOutlet weak var storyImagesCollectionView: UICollectionView!
    @IBOutlet weak var collectionViewHeight: NSLayoutConstraint!
    @IBOutlet weak var summaryLabel: UILabel!
    @IBOutlet weak var storyContentTableView: UITableView!
    @IBOutlet weak var tableViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
        title = Constants.detailedStoryNavTitle
        fetchStory(detailUrl: detailUrl)
    }
    
    @IBAction func retryBtnTapped(_ sender: UIButton) {
        fetchStory(detailUrl: detailUrl)
    }
    
    /**
     Fetch the detailed story from server and setup views accordingly.
     */
    func fetchStory(detailUrl: String) {
        retryBtn.isHidden = true
        
        storyImagesCollectionView.isHidden = true
        summaryLabel.isHidden = true
        storyContentTableView.isHidden = true
        
        SwiftSpinner.show(delay: 0.3, title: Constants.spinnerMessage)
        fetchNewsService.fetchDetailedNews(detailUrl: detailUrl) { [weak self] (cricbuzzDetailedStory) in
            SwiftSpinner.hide()
            guard let weakSelf = self, let cricbuzzDetailedStory = cricbuzzDetailedStory else {
                self?.retryBtn.isHidden = false
                return
            }
            
            weakSelf.cricbuzzDetailedStory = cricbuzzDetailedStory
            weakSelf.summaryLabel.text = cricbuzzDetailedStory.summary
            weakSelf.summaryLabel.isHidden = false
            
            weakSelf.setupCollectionView()
            weakSelf.setupTableView()
        }
    }
    
    func setupCollectionView() {
        guard !cricbuzzDetailedStory.imageLinksArray.isEmpty else {
            collectionViewHeight.constant = 0
            return
        }
        storyImagesCollectionView.isHidden = false
        storyImagesCollectionView.reloadData()
    }
    
    func setupTableView() {
        guard !cricbuzzDetailedStory.contentsArray.isEmpty else {
            tableViewHeight.constant = 0
            return
        }
        storyContentTableView.isHidden = false
        storyContentTableView.reloadData()
    }
    
    func configureView() {
        storyContentTableView.rowHeight = UITableViewAutomaticDimension
        storyContentTableView.estimatedRowHeight = 44.0
        
        storyContentTableView.showsHorizontalScrollIndicator = false
        storyContentTableView.showsVerticalScrollIndicator = false
        
        storyImagesCollectionView.showsHorizontalScrollIndicator = false
        storyImagesCollectionView.showsVerticalScrollIndicator = false
    }
    
    func setupWith(detailUrl: String, fetchNewsService: CricbuzzServiceProtocol) {
        self.detailUrl = detailUrl
        self.fetchNewsService = fetchNewsService
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

// MARK:- UICollectionViewDataSource, UICollectionViewDelegate

extension DetailStoryViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let cricbuzzDetailedStory = cricbuzzDetailedStory else {
            return 0
        }
        return cricbuzzDetailedStory.imageLinksArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let storyCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.storyCollectionViewCell, for: indexPath) as? DetailStoryCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        storyCollectionViewCell.configureStoryImageCell(imageLink: cricbuzzDetailedStory.imageLinksArray[indexPath.row])
        return storyCollectionViewCell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let storyCollectionViewCell = collectionView.cellForItem(at: indexPath) as? DetailStoryCollectionViewCell, let downloadedImage = storyCollectionViewCell.downloadedImage else {
            return
        }
        let imageInfo   = GSImageInfo(image: downloadedImage, imageMode: .aspectFit)
        let transitionInfo = GSTransitionInfo(fromView: storyCollectionViewCell.storyImageView!)
        let imageViewer = GSImageViewerController(imageInfo: imageInfo, transitionInfo: transitionInfo)
        present(imageViewer, animated: true, completion: nil)
    }
}

// MARK:- UITableViewDelegate, UITableViewDataSource

extension DetailStoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let cricbuzzDetailedStory = cricbuzzDetailedStory else {
            return 0
        }
        return cricbuzzDetailedStory.contentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let storyTableViewCell = tableView.dequeueReusableCell(withIdentifier: Constants.storyTableViewCell, for: indexPath) as? DetailStoryTableViewCell else {
            return UITableViewCell()
        }
        storyTableViewCell.configureStoryContentCell(content: cricbuzzDetailedStory.contentsArray[indexPath.row])
        storyTableViewCell.selectionStyle = .none
        return storyTableViewCell
    }
}
