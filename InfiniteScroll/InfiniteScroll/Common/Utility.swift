//
//  Utility.swift
//  InfiniteScroll
//
//  Created by Anirudh Das on 7/7/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import UIKit

@objc public class Utility: NSObject {
    
}

extension Utility {
    
    /**
     Method to show an alert with a message.
     
     - parameter title: The title of the alert.
     - parameter message: The message of the alert.
     - parameter viewController: The viewController on which the alert has to be shown.
     */
    public class func showAlertMessage(title: String,
                                       message: String,
                                       viewController: UIViewController) {
        let ac = UIAlertController(title: title,
                                   message: message,
                                   preferredStyle: UIAlertControllerStyle.alert)
        
        let handler = { (action: UIAlertAction) -> Void in
            ac.dismiss(animated: true, completion: nil)
        }
        let acAction = UIAlertAction(title: "OK",
                                     style: UIAlertActionStyle.default,
                                     handler: handler)
        ac.addAction(acAction)
        viewController.present(ac, animated: true, completion: nil)
    }
    
    //Generates a URL Query String from a dictionary
    open class func generateQueryString(_ dictionary: [String: String]) -> String {
        var str: String = ""
        for (key, value) in dictionary {
            str = str + "&" + key + "=" + value
        }
        return "?" + str.trimmingCharacters(in: CharacterSet(charactersIn: "&"))
    }
    
    //Encodes a string to URL Encoded Format
    open class func addURLEncoding(_ string: String) -> String {
        return string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)!
    }
    
    /**
     Method to check if the app is running on simulator or device. Returns 'true' is running on simulator.
     */
    public class var isRunningSimulator: Bool {
        get {
            return TARGET_OS_SIMULATOR != 0 // Use this line in Xcode 7 or newer
        }
    }
}

/*
 Adds rounded corner to a view
 */
public extension UIView {
    public func addCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }
}


/*
 Converts Date object to Milliseconds and String
 */
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
        formatter.timeZone = TimeZone(abbreviation: "IST")
        return formatter.string(from: self)
    }
}

/*
 Converts String object to Date
 */
public extension String {
    public func toDate(format:String) -> Date? {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        formatter.timeZone = TimeZone(abbreviation: "IST")
        return formatter.date(from: self)
    }
}

/*
 Converts Dictionary to Json String
 */
extension Dictionary {
    var jsonString: String {
        let invalidJson = "Not a valid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }
    
    func toJSONString() -> String {
        return jsonString
    }
}

/**
 Utility to check the type of device
*/
public extension UIDevice {
    public var iPhoneX: Bool {
        return UIScreen.main.nativeBounds.height == 2436
    }
    
    public var iPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    
    public var iPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }
    
    public enum ScreenType: String {
        case iPhone4_4S = "iPhone 4 or iPhone 4S"
        case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
        case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
        case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
        case iPhoneX = "iPhone X"
        case unknown
    }
    
    public var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
            case 960:
                return .iPhone4_4S
            case 1136:
                return .iPhones_5_5s_5c_SE
            case 1334:
                return .iPhones_6_6s_7_8
            case 1920, 2208:
                return .iPhones_6Plus_6sPlus_7Plus_8Plus
            case 2436:
                return .iPhoneX
            default:
                return .unknown
        }
    }
}

