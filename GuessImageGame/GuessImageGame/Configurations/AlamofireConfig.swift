import Foundation
import Alamofire

/**
 Alamofire Configurations -
 - Singleton with **TimeOut Interval** configurable
*/
final class AlamofireConfig {
    static let shared = AlamofireConfig()
    let manager: Alamofire.SessionManager
    
    private init() {
        manager = Alamofire.SessionManager.default
        manager.session.configuration.timeoutIntervalForRequest = 30
        manager.session.configuration.timeoutIntervalForResource = 30
    }
}
