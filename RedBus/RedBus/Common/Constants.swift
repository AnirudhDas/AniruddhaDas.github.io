//
//  Constants.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import UIKit

struct Constants {
    //Images
    public static let placeholderImage: UIImage = #imageLiteral(resourceName: "placeholder")
    public static let filterOff: UIImage = #imageLiteral(resourceName: "filterOff")
    
    public static let ratingOff: UIImage = #imageLiteral(resourceName: "ratingOff")
    public static let ratingOn: UIImage = #imageLiteral(resourceName: "ratingOn")
    
    public static let timeOn: UIImage = #imageLiteral(resourceName: "timeOn")
    public static let timeOff: UIImage = #imageLiteral(resourceName: "timeOff")
    
    public static let fareOff: UIImage = #imageLiteral(resourceName: "fareOff")
    public static let fareOn: UIImage = #imageLiteral(resourceName: "fareOn")
    
    public static let arrowUp: UIImage = #imageLiteral(resourceName: "arrowUp")
    public static let arrowDown: UIImage = #imageLiteral(resourceName: "arrowDown")
    
    public static let acOff: UIImage = #imageLiteral(resourceName: "acOff")
    public static let noAccOff: UIImage = #imageLiteral(resourceName: "noAccOff")
    public static let acOn: UIImage = #imageLiteral(resourceName: "acOn")
    public static let noAccOn: UIImage = #imageLiteral(resourceName: "noAccOn")
    
    public static let seaterOff: UIImage = #imageLiteral(resourceName: "seaterOff")
    public static let seaterOn: UIImage = #imageLiteral(resourceName: "seaterOn")
    
    public static let sleeperOff: UIImage = #imageLiteral(resourceName: "sleeperOff")
    public static let sleeperOn: UIImage = #imageLiteral(resourceName: "sleeperOn")
    
    //Storyboard Identifiers
    public static let filterVCStoryboardId = "filterVC"
    public static let busCell = "busCell"
    public static let bookingCell = "bookingCell"
    
    //Alerts
    public static let bookingAlertTitle = "Confirm Booking"
    public static let bookingAlertMessage = "Are you sure you want to book your bus?"
    public static let bookingAlertOK = "Book"
    public static let bookingAlertCancel = "Dismiss"
    
    public static let cancelAlertTitle = "Confirm Cancel"
    public static let cancelAlertMessage = "Are you sure you want to cancel your booking?"
    public static let cancelAlertOK = "Proceed"
    public static let cancelAlertCancel = "Dismiss"
    
    public static let updateAlertPlaceholder = "Enter rating"
    public static let updateAlertTitle = "Confirm Update"
    public static let updateAlertMessage = "Are you sure you want to update rating?"
    public static let updateAlertOK = "Update"
    public static let updateAlertCancel = "Dismiss"
}
