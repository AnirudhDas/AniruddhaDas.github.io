//
//  BookingTableViewCell.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

class BookingTableViewCell: UITableViewCell {

    @IBOutlet weak var lblOperatorName: UILabel!
    var bus: Bus!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configureCell(bus: Bus) {
        self.bus = bus
        lblOperatorName.text = "\(bus.operatorName) - \(bus.rating)"
    }
}
