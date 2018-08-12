//
//  Utility.swift
//  WikipediaSearch
//
//  Created by Anirudh Das on 8/12/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation
import UIKit

@objc public class Utility: NSObject {
    
}

/// Extension for Reachablity
extension Utility {
    /**
     Method to check if network is available.
     
     - Returns true if available, false if not connected.
     */
    public class func isNetworkAvailable() -> Bool {
        return ReachablityClient.sharedInstance().reachability.isReachableViaWiFi == true || ReachablityClient.sharedInstance().reachability.isReachableViaWWAN == true
    }
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
    open class func addURLEncoding(_ string: String) -> String? {
        return string.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
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
