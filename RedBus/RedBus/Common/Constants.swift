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
    
    public static let filter: UIImage = #imageLiteral(resourceName: "filter")
    public static let clearFilter: UIImage = #imageLiteral(resourceName: "clearFilter")
    
    public static let ratingDeselected: UIImage = #imageLiteral(resourceName: "ratingDeselected")
    public static let ratingSelected: UIImage = #imageLiteral(resourceName: "ratingSelected")
    
    public static let depatureDeselected: UIImage = #imageLiteral(resourceName: "departureDeselected")
    public static let depatureSelected: UIImage = #imageLiteral(resourceName: "departureSelected")
    
    public static let fareDeselected: UIImage = #imageLiteral(resourceName: "fareDeselected")
    public static let fareSelected: UIImage = #imageLiteral(resourceName: "fareSelected")
    
    public static let arrowUp: UIImage = #imageLiteral(resourceName: "arrowUp")
    public static let arrowDown: UIImage = #imageLiteral(resourceName: "arrowDown")
    
    public static let acDeselected: UIImage = #imageLiteral(resourceName: "acDeselected")
    public static let acSelected: UIImage = #imageLiteral(resourceName: "acSelected")
    
    public static let nonACDeselected: UIImage = #imageLiteral(resourceName: "nonACDeselected")
    public static let nonACSelected: UIImage = #imageLiteral(resourceName: "nonACSelected")
    
    public static let seaterDeselected: UIImage = #imageLiteral(resourceName: "seaterDeselected")
    public static let seaterSelected: UIImage = #imageLiteral(resourceName: "seaterSelected")
    
    public static let sleeperDeselected: UIImage = #imageLiteral(resourceName: "sleeperDeselected")
    public static let sleeperSelected: UIImage = #imageLiteral(resourceName: "sleeperSelected")
    
    //Storyboard Identifiers
    public static let filterVCStoryboardId = "filterVC"
    public static let busCell = "busCell"
    public static let bookingCell = "bookingCell"
    
    //Alerts
    public static let bookingAlertTitle = "Confirm Booking"
    public static let bookingAlertMessage = "Are you sure you want to book your bus"
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
