//
//  GCDBlackBox.swift
//  InfiniteScroll
//
//  Created by Anirudh Das on 7/7/18.
//  Copyright © 2018 Aniruddha Das. All rights reserved.
//

import Foundation

/**
 Method to perform operations on Main Thread.
 
 - parameter updates: A block that needs to be executed on Main Thread.
 */
func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
        updates()
    }
}

/**
 Method to perform operations on Background Thread.
 
 - parameter updates: A block that needs to be executed on Background Thread.
 */
func performOperationInBackground(_ updates: @escaping () -> Void) {
    DispatchQueue.global(qos: .background).async {
        updates()
    }
}
/**
 Method to perform operations on Main Thread after some delay.
 
 - parameter delayTime: The time interval for which you want to delay the execution
 - parameter updates: A block that needs to be executed on Main Thread after the delay.
 */
func performOperationOnMainAfterDelay(delayTimeInSeconds delay: Int, _ updates: @escaping () -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(delay), execute: {
        updates()
    })
}
