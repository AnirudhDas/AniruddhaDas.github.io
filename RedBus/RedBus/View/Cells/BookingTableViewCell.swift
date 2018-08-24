//
//  BookingTableViewCell.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import UIKit

class BookingTableViewCell: UITableViewCell {

    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var sourceLbl: UILabel!
    @IBOutlet weak var departureTimeLbl: UILabel!
    @IBOutlet weak var destinationLbl: UILabel!
    @IBOutlet weak var arrivalTimeLbl: UILabel!
    @IBOutlet weak var busLogoImg: UIImageView!
    @IBOutlet weak var busNameLbl: UILabel!
    @IBOutlet weak var ratingLbl: UILabel!
    @IBOutlet weak var busTypeLbl: UILabel!
    @IBOutlet weak var fareLbl: UILabel!
    
    var bus: Bus!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        busLogoImg.addShadow()
        ratingLbl.addShadow()
        bgView.addShadow()
    }
    
    func configureCell(busDetail: Bus) {
        self.bus = busDetail
        
        self.sourceLbl.text = busDetail.source
        self.destinationLbl.text = busDetail.destination
        if let currency = busDetail.currency {
            self.fareLbl.text = "\(currency) \(busDetail.fare)"
        } else {
            self.fareLbl.text = ""
        }
        self.busNameLbl.text = busDetail.operatorName
        
        if let busLogoURL = busDetail.busLogoURL, busLogoURL != "", let imageUrl = URL(string: busLogoURL) {
            self.busLogoImg.sd_setImage(with: imageUrl, placeholderImage: Constants.placeholderImage, options: [.continueInBackground, .progressiveDownload])
        } else {
            self.busLogoImg.image = Constants.placeholderImage
        }
        
        if busDetail.rating != -1 {
            self.ratingLbl.isHidden = false
            if busDetail.rating >= 4 {
                self.ratingLbl.text = "\(busDetail.rating) ★"
                self.ratingLbl.backgroundColor = UIColor.ratingGreen()
            } else if busDetail.rating >= 3 {
                self.ratingLbl.text = "\(busDetail.rating) ★"
                self.ratingLbl.backgroundColor = UIColor.ratingYellow()
            } else if busDetail.rating > 0 {
                self.ratingLbl.text = "\(busDetail.rating) ★"
                self.ratingLbl.backgroundColor = UIColor.ratingRed()
            } else {
                self.ratingLbl.isHidden = true
            }
        } else {
            self.ratingLbl.isHidden = true
        }
        
        if let hourMinute = Date(milliseconds: busDetail.departureTime).toString(with: "h:mm a") {
            self.departureTimeLbl.text = "Board at \(hourMinute)"
        } else {
            self.departureTimeLbl.text = ""
        }
        
        if busDetail.arrivalTime != -1, let hourMinute = Date(milliseconds: busDetail.arrivalTime).toString(with: "h:mm a") {
            self.arrivalTimeLbl.isHidden = false
            self.arrivalTimeLbl.text = "Drop at \(hourMinute)"
        } else {
            self.arrivalTimeLbl.isHidden = true
        }
        
        self.busTypeLbl.text = (busDetail.isAC ? "AC": "") + (busDetail.isNONAC ? " NON-AC" : "") + (busDetail.isSEATER ? " SEATER" : "") + (busDetail.isSLEEPER ? " SLEEPER" : "")
    }
}
