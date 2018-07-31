//
//  DetailStoryCollectionViewCell.swift
//  CricketNews
//
//  Created by Anirudh Das on 7/5/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit
import SDWebImage

/**
 Custom Cell for Story Images
 */
class DetailStoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var storyImageView: UIImageView!
    var downloadedImage: UIImage?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        storyImageView.layer.cornerRadius = 5
    }
    
    func configureStoryImageCell(imageLink: String) {
        if let imageUrl = NSURL(string: imageLink) {
            storyImageView.sd_setImage(with: imageUrl as URL!, placeholderImage: Constants.placeholderImage, options: [.continueInBackground, .progressiveDownload]) { (image, error, type, url) in
                self.downloadedImage = image
            }
        }
    }
}
