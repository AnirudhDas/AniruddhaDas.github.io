import UIKit
import SwiftSpinner

/**
 Has a 3 * 3 grid view with 9 images, memorize and guess the image
 */
class GuessImageViewController: BaseViewController {

    @IBOutlet weak var guessImageCollectionView: UICollectionView!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var hintImage: UIImageView!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var playAgainBtn: UIButton!
    
    var flickerService: FlickServiceProtocol!
    var timeProvider: Timer!
    var timeLeftToStart: TimeInterval!
    var photoArray: [FlickrPhoto]!
    var randomIndex: Int!
    
    //Dependency Injection
    convenience init(flickerService: FlickServiceProtocol) {
        self.init()
        self.flickerService = flickerService
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationTitle(title: NAVIGATION_BAR_TITLE)
        setupViewController()
        playGame()
    }
    
    func setupViewController() {
        if flickerService == nil {
            flickerService = FlickImageService(apiURL: ServerConfiguration.apiFetchPhotos + "?format=json&nojsoncallback=1")
        }
        playAgainBtn.setTitle(PLAY_AGAIN, for: .normal)
        playAgainBtn.addTarget(self, action: #selector(self.playGame), for: .touchUpInside)
        timerLabel.textColor = UIColor.white
    }
    
    @objc func clock() {
        timeLeftToStart = timeLeftToStart - 1
        if timeLeftToStart == 0 {
            timerLabel.isHidden = true
            timeProvider.invalidate()
            
            self.randomIndex = Int(arc4random_uniform(UInt32(photoArray.count > MAX_NUMBER_OF_IMAGES ? MAX_NUMBER_OF_IMAGES : photoArray.count)))
            performOperationOnMainAfterDelay(delayTimeInSeconds: 1, {
                self.hintImage.sd_setImage(with: self.photoArray[self.randomIndex].photoUrl as URL!, placeholderImage: UIImage(named: "1"), options: [.continueInBackground, .progressiveDownload]) { (image, error, type, url) in
                    self.hintImage.isHidden = false
                    self.infoLabel.isHidden = false
                    self.infoLabel.text = GUESS_WHERE_THIS_PHTO_WAS
                    self.infoLabel.textColor = UIColor.white
                    self.guessImageCollectionView.isUserInteractionEnabled = true
                }
            })
        } else {
            timerLabel.text = "Starting in \(Int(timeLeftToStart)) seconds"
        }
    }
    
    @objc func playGame() {
        photoArray = []
        timeLeftToStart = STARTING_TIME
        
        self.guessImageCollectionView.isHidden = true
        self.timerLabel.isHidden = true
        self.hintImage.isHidden = true
        self.infoLabel.isHidden = true
        self.playAgainBtn.isHidden = true
        self.guessImageCollectionView.isUserInteractionEnabled = false
        
        SwiftSpinner.show(delay: 0.3, title: SPINNER_TITLE)
        self.fetchImages { [weak self] (flickPhotosArray) in
            SwiftSpinner.hide()
            guard let weakSelf = self else { return }
            if let flickPhotosArray = flickPhotosArray {
                weakSelf.photoArray = flickPhotosArray
                
                weakSelf.guessImageCollectionView.isHidden = false
                weakSelf.guessImageCollectionView.reloadData()
                
                weakSelf.timeProvider = Timer.scheduledTimer(timeInterval: 1, target: weakSelf, selector: #selector(weakSelf.clock), userInfo: nil, repeats: true)
                weakSelf.timeProvider.fire()
                weakSelf.timerLabel.isHidden = false
            } else {
                weakSelf.playAgainBtn.isHidden = false
            }
        }
    }
    
    func fetchImages(completionBlock: @escaping (_ flickrResponse:  [FlickrPhoto]?) -> Void) {
        self.flickerService.fetchImages { (flickrResponse) in
            completionBlock(flickrResponse)
        }
    }
}

extension GuessImageViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoArray.count > MAX_NUMBER_OF_IMAGES ? MAX_NUMBER_OF_IMAGES : photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCellIdentifier, for: indexPath) as? ImageCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.setupWithPhoto(flickrPhoto: photoArray[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ImageCollectionViewCell, cell.isFlipped == false else {
            return
        }
        if cell.flipImage(flickrPhoto: photoArray[self.randomIndex]) == true {
            self.infoLabel.text = "Right Answer"
            self.infoLabel.textColor = UIColor.green
            
            self.guessImageCollectionView.isHidden = true
            self.timerLabel.isHidden = true
            self.playAgainBtn.isHidden = false
        } else {
            self.infoLabel.text = "Wrong Answer"
            self.infoLabel.textColor = UIColor.red
        }
    }
    
    //Have exactly 3 items each row
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width / 3.0
        let height = width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
