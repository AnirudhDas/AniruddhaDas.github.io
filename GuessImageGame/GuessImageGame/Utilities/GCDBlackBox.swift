import Foundation

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
