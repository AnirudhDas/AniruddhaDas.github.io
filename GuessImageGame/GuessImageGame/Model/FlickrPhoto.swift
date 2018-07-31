import Foundation
import SwiftyJSON

/**
 Model with Path for Image Download
 
 - **link**: Path for Image
 - **photoUrl**: URL equivalent of link
*/
public struct FlickrPhoto: Equatable {
    public var link: String
    
    var photoUrl: NSURL {
        return NSURL(string: link)!
    }
    
    public init?(_ json: JSON) {
        guard let media = json["media"].dictionary, let link = media["m"]?.string else {
            return nil
        }
        self.link = link
    }
    
    public init(link: String) {
        self.link = link
    }
}

public func ==(lhs: FlickrPhoto, rhs: FlickrPhoto) -> Bool {
    return lhs.link == rhs.link
}
