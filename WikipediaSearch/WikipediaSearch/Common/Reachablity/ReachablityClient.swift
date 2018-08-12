//
//  ReachablityClient.swift
//  WikipediaSearch
//
//  Created by Anirudh Das on 8/12/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation

// MARK: - ReachablityClient: NSObject

class ReachablityClient: NSObject {
    
    // MARK: Properties
    
    let reachability = CustomReachability()!
    
    // MARK: Initializers
    
    override init() {
        super.init()
        
        reachability.whenReachable = { reachability in
            // this is called on a background thread, but UI updates must
            // be on the main thread, like this:
            DispatchQueue.main.async {
                if reachability.isReachableViaWiFi {
                    //print("Reachable via WiFi")
                    NotificationCenter.default.post(name: NETWORKFOUND, object: self)
                } else {
                    //print("Reachable via Cellular")
                    NotificationCenter.default.post(name: NETWORKFOUND, object: self)
                }
            }
        }
        
        reachability.whenUnreachable = { reachability in
            // this is called on a background thread, but UI updates must
            // be on the main thread, like this:
            DispatchQueue.main.async {
                //print("Not reachable")
                NotificationCenter.default.post(name: NETWORKLOST, object: self)
            }
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            //print("Unable to start notifier")
        }
        
    }
    
    // MARK: Shared Instance
    
    class func sharedInstance() -> ReachablityClient {
        struct Singleton {
            static var sharedInstance = ReachablityClient()
        }
        return Singleton.sharedInstance
    }
    
}

public let NETWORKLOST = Notification.Name("Notification.FordShuttleRiderApp.NETWORKLOST")
public let NETWORKFOUND = Notification.Name("Notification.FordShuttleRiderApp.NETWORKFOUND")
