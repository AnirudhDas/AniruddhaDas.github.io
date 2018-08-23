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
    
    @nonobjc class var redBusRed: UIColor {
        return UIColor(red: 216.0 / 255.0, green: 79.0 / 255.0, blue: 86.0 / 255.0, alpha: 1.0)
    }
    
    @nonobjc class var redBusGreen: UIColor {
        return UIColor(red: 0.0, green: (210/255), blue: 0.0, alpha: 0.9)
    }
    
    @nonobjc class var redBusYellow: UIColor {
        return UIColor(red: (237/255), green: (218/255), blue: 0.0, alpha: 0.9)
    }
    
    @nonobjc class var redBusRedDark: UIColor {
        return UIColor(red: (237/255), green: (28/255), blue: 0.0, alpha: 0.9)
    }
    
    @nonobjc class var blackBrown: UIColor {
        return UIColor(red: 40.0 / 255.0, green: 35.0 / 255.0, blue: 30.0 / 255.0, alpha: 1.0)
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
        
        if let cancelTitleTxt = cancelButtonTitle  {
            let cancelAction = UIAlertAction(title: cancelTitleTxt, style: .default, handler: cancelHandler)
            ac.addAction(cancelAction)
        }
        
        // *** Ok button action ***//
        if let okTitleTxt = okButtonTitle {
            let okAction = UIAlertAction(title: okTitleTxt, style: .default, handler: okHandler)
            ac.addAction(okAction)
        }
        
        // *** Add text field ***//
        if let txtField = textField {
            ac.addTextField(configurationHandler: txtField)
        }
        
        viewController.present(ac, animated: true, completion: nil)
        
        return ac
    }

    //Encodes a string to URL Encoded Format
    open class func addURLEncoding(_ string: String) -> String? {
        return string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
    }
}
