//
//  BusTableViewCell.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

class BusTableViewCell: UITableViewCell {

    @IBOutlet weak var lblOperatorName: UILabel!
    var busDetail: BusDetail!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(busDetail: BusDetail) {
        self.busDetail = busDetail
        lblOperatorName.text = busDetail.operatorName
    }
}
