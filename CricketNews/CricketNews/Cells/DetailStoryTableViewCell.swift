//
//  DetailStoryTableViewCell.swift
//  CricketNews
//
//  Created by Anirudh Das on 7/6/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

/**
 Custom Cell for Story Content
 */
class DetailStoryTableViewCell: UITableViewCell {

    @IBOutlet weak var contentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureStoryContentCell(content: String) {
        contentLabel.text = content
    }
}
