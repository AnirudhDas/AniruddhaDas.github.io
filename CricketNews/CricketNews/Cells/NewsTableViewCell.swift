//
//  NewsTableViewCell.swift
//  CricketNews
//
//  Created by Anirudh Das on 7/5/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit
import SDWebImage

/**
 Custom Cell for News
 */
class NewsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var newsHeadingLabel: UILabel!
    
    var detailUrl: String?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        newsImageView.layer.cornerRadius = 5
    }
    
    func configureNewsCell(detailedBaseUrl: String, news: CricbuzzNews) {
        detailUrl = detailedBaseUrl + news.id
        newsHeadingLabel.text = news.headline
        
        if let imageLink = news.imageLink, let imageUrl = NSURL(string: imageLink) {
            newsImageView.sd_setImage(with: imageUrl as URL!, placeholderImage: Constants.placeholderImage, options: [.continueInBackground, .progressiveDownload])
        }
    }
}
