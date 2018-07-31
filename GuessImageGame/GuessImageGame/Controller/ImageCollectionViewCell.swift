import UIKit
import SDWebImage

/**
 Grid cell with methods to set and flip the image.
*/
class ImageCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var guessImage: UIImageView!
    
    var isFlipped: Bool = false
    var isTappable: Bool = false
    var timeProvider: Timer!
    var originalPhoto: FlickrPhoto!
    
    func setupWithPhoto(flickrPhoto: FlickrPhoto) {
        isFlipped = false
        originalPhoto = flickrPhoto
        guessImage.sd_setImage(with: flickrPhoto.photoUrl as URL!, placeholderImage: PLACEHOLDER, options: [.continueInBackground, .progressiveDownload]) { (image, error, type, url) in
        }
        self.timeProvider = Timer.scheduledTimer(timeInterval: TimeInterval(STARTING_TIME), target: self, selector: #selector(self.clock), userInfo: nil, repeats: false)
    }
    
    @objc func clock() {
        isTappable = true
        timeProvider.invalidate()
        guessImage.image = FLIPPED
        UIView.transition(with: guessImage, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
    }
    
    func flipImage(flickrPhoto: FlickrPhoto) -> Bool {
        guard isTappable == true else {
            return false
        }
        isFlipped = true
        guessImage.sd_setImage(with: originalPhoto.photoUrl as URL!, placeholderImage: PLACEHOLDER, options: [.continueInBackground, .progressiveDownload]) { (image, error, type, url) in
            UIView.transition(with: self.guessImage, duration: 0.3, options: .transitionFlipFromRight, animations: nil, completion: nil)
        }
        return flickrPhoto == originalPhoto
    }
}
