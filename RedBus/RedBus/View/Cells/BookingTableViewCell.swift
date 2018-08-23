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
    @IBOutlet weak var currencyLbl: UILabel!
    
    var bus: Bus!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        busLogoImg.layer.cornerRadius = 3.0
        ratingLbl.layer.cornerRadius = 3.0
        dropShadow()
    }
    
    func dropShadow() {
        let color = UIColor.lightGray
        let opacity: Float = 0.5
        let offset = CGSize(width: -1, height: 1)
        let radius: CGFloat = 3.0
        bgView.layer.cornerRadius = 3.0
        bgView.layer.masksToBounds = false
        bgView.layer.shadowColor = color.cgColor
        bgView.layer.shadowOpacity = opacity
        bgView.layer.shadowOffset = offset
        bgView.layer.shadowRadius = radius
    }
    
    func configureCell(busDetail: Bus) {
        self.bus = busDetail
        self.sourceLbl.text = busDetail.source
        self.destinationLbl.text = busDetail.destination
        self.fareLbl.text = "\(busDetail.fare)"
        self.currencyLbl.text = busDetail.currency
        self.busNameLbl.text = busDetail.operatorName
        
        if let busLogoURL = busDetail.busLogoURL, busLogoURL != "", let imageUrl = URL(string: busLogoURL) {
            self.busLogoImg.sd_setImage(with: imageUrl, placeholderImage: Constants.placeholderImage, options: [.continueInBackground, .progressiveDownload])
        } else {
            self.busLogoImg.image = Constants.placeholderImage
        }
        
        if busDetail.rating != -1 {
            self.ratingLbl.isHidden = false
            if busDetail.rating >= 4 {
                self.ratingLbl.text = "\(busDetail.rating)"
                self.ratingLbl.backgroundColor = UIColor.redBusGreen
            } else if busDetail.rating >= 3 {
                self.ratingLbl.text = "\(busDetail.rating)"
                self.ratingLbl.backgroundColor = UIColor.redBusYellow
            } else if busDetail.rating > 0 {
                self.ratingLbl.text = "\(busDetail.rating)"
                self.ratingLbl.backgroundColor = UIColor.redBusRedDark
            } else {
                self.ratingLbl.isHidden = true
            }
        } else {
            self.ratingLbl.isHidden = true
        }
        
        if let hourMinute = Date(milliseconds: busDetail.departureTime).toString(with: "HH:mm a") {
            self.departureTimeLbl.text = "(\(hourMinute))"
        } else {
            self.departureTimeLbl.text = ""
        }
        
        if busDetail.arrivalTime != -1, let hourMinute = Date(milliseconds: busDetail.arrivalTime).toString(with: "HH:mm a") {
            self.arrivalTimeLbl.isHidden = false
            self.arrivalTimeLbl.text = "(\(hourMinute))"
        } else {
            self.arrivalTimeLbl.isHidden = true
        }
        
        let busFeatureType: BusType = BusType(isAc: busDetail.isAC, isNonAc: busDetail.isNONAC, isSeater: busDetail.isSEATER, isSleeper: busDetail.isSLEEPER)
        
        var busTypeStr = ""
        if busFeatureType.isAc {
            busTypeStr += "AC"
        } else {
            busTypeStr += ""
        }
        
        if busFeatureType.isNonAc {
            busTypeStr += " NON-AC"
        } else {
            busTypeStr += ""
        }
        
        if busFeatureType.isSeater {
            busTypeStr += " SEATER"
        } else {
            busTypeStr += ""
        }
        
        if busFeatureType.isSleeper {
            busTypeStr += " SLEEPER"
        } else {
            busTypeStr += ""
        }
        
        self.busTypeLbl.text = busTypeStr
    }
}
