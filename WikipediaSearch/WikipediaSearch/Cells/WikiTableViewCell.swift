//
//  WikiTableViewCell.swift
//  WikipediaSearch
//
//  Created by Anirudh Das on 8/11/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit
import SDWebImage

protocol WikiTableViewCellProtocol {
    func configureResultCell(wikiResult: WikiResult)
}

class WikiTableViewCell: UITableViewCell, WikiTableViewCellProtocol {
    
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var itemImgView: UIImageView!
    var wikiResult: WikiResult!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addCornerRadius(radius: 5.0)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureResultCell(wikiResult: WikiResult) {
        self.wikiResult = wikiResult
        titleLbl.text = wikiResult.title
        descriptionLbl.text = wikiResult.wikiDescription ?? ""
        
        if let imageSource = wikiResult.imageSource, let imageUrl = URL(string: imageSource) {
            itemImgView.sd_setImage(with: imageUrl, placeholderImage: Constants.placeholderImage, options: [.continueInBackground, .progressiveDownload]) { (_, _, _, _) in
            }
        }
    }
}
