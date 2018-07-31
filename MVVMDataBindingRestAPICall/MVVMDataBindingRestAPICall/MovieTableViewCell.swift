//
//  MovieTableViewCell.swift
//  MVVMDataBindingRestAPICall
//
//  Created by Anirudh Das on 7/26/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {

    @IBOutlet weak var movieNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    func configureMovieCell(movie: Movie) {
        movieNameLbl.text = movie.name
    }
}
