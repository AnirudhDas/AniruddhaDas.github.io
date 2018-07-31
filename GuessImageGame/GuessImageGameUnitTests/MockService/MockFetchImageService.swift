import Foundation
@testable import GuessImageGame
import SwiftyJSON

/**
 Mocks the FlickImageService class
 */
class MockFlickImageService: FlickServiceProtocol {
    var apiURL: String!
    
    init(apiURL: String) {
        self.apiURL = apiURL
    }
    
    func fetchImages(completionBlock: @escaping (_ array:  [FlickrPhoto]?) -> Void) {
        AlamofireConfig.shared.manager.request(self.apiURL)
            .validate(statusCode: 200..<300)
            .responseJSON { response in
                switch response.result {
                case .success:
                    let json = JSON(data: response.data!)
                    guard json != JSON.null, let items = json["items"].array else {
                        completionBlock(nil)
                        return
                    }
                    var photoArray: [FlickrPhoto] = []
                    for item in items {
                        if let photo = FlickrPhoto(item) {
                            photoArray.append(photo)
                        }
                    }
                    guard !photoArray.isEmpty else {
                        completionBlock(nil)
                        return
                    }
                    completionBlock(photoArray)
                case .failure(_):
                    completionBlock(nil)
                }
        }
    }
}
