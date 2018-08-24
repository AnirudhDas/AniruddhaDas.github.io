//
//  Utility.swift
//  RedBus
//
//  Created by Anirudh Das on 8/22/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public static func ratingRed() -> UIColor {
        return UIColor(red:201/255, green:87/255, blue:87/255, alpha:1.00)
    }
    
    public static func ratingGreen() -> UIColor {
        return UIColor(red:0.30, green:0.72, blue:0.53, alpha:1.00)
    }
    
    public static func ratingYellow() -> UIColor {
        return UIColor(red: 201/255, green: 187/255, blue: 87/255, alpha:1.00)
    }
    
    public static func lightNavyColor() -> UIColor {
        return UIColor(red: 22.0/255, green: 86/255, blue: 136/255, alpha:1.00)
    }
    
    /**
     Initializer of UIColor which accepts a hex-color string.
     */
    public convenience init(hexString: String) {
        let scanner  = Scanner(string: hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines))
        
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        
        let mask = 0x000000FF
        let r = Int(color >> 16) & mask
        let g = Int(color >> 8) & mask
        let b = Int(color) & mask
        
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        
        self.init(red:red, green:green, blue:blue, alpha:1)
    }
}

public extension Date {
    public var millisecondsSince1970: Double {
        return Double((self.timeIntervalSince1970 * 1000.0).rounded())
    }
    
    public init(milliseconds: Double) {
        self = Date(timeIntervalSince1970: (milliseconds / 1000.0))
    }
    
    public func toString(with format:String) -> String? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(abbreviation: "IST") //TimeZone.ReferenceType.local //TimeZone.current
        return formatter.string(from: self)
    }
}

public extension String {
    public func toDate(format:String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(abbreviation: "IST") //TimeZone.ReferenceType.local //TimeZone.current
        return formatter.date(from: self)
    }
}

@objc public class Utility: NSObject {
    
}

extension Utility {
    /**
     Method to show an alert with attributed message.
     
     - parameter title: The title of the alert.
     - parameter message: The message of the alert.
     - parameter viewController: The viewController on which the alert has to be shown.
     - parameter okButtonTitle: The title text of 'Ok' button.
     - parameter okHandler: 'Ok' button action call back.
     - parameter cancelButtonTittle: The title text of 'Cancel' button.
     - parameter cancelHandler: 'Cancel' button action call back.
     - parameter textField: adds a textField for user input.
     */
    public class func showAlertMessage(title: String,
                                       message: String,
                                       viewController: UIViewController,
                                       okButtonTitle: String? = nil,
                                       okHandler: ((UIAlertAction) -> Void)? = nil,
                                       cancelButtonTitle: String? = nil,
                                       cancelHandler: ((UIAlertAction) -> Void)? = nil,
                                       textField: ((UITextField) -> Void)? = nil) -> UIAlertController {
        let ac = UIAlertController(title: title,
                                   message: message,
                                   preferredStyle: UIAlertControllerStyle.alert)
        
        //Cancel button action
        if let cancelTitleTxt = cancelButtonTitle  {
            let cancelAction = UIAlertAction(title: cancelTitleTxt, style: .default, handler: cancelHandler)
            ac.addAction(cancelAction)
        }
        
        //Ok button action
        if let okTitleTxt = okButtonTitle {
            let okAction = UIAlertAction(title: okTitleTxt, style: .default, handler: okHandler)
            ac.addAction(okAction)
        }
        
        //Add text field
        if let txtField = textField {
            ac.addTextField(configurationHandler: txtField)
        }
        
        viewController.present(ac, animated: true, completion: nil)
        
        return ac
    }
}
