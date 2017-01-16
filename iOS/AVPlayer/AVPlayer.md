# Play a video within an UIView

```
import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var playerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.playVideo()
    }
    
    func playVideo() {
    
    	let moviePath = Bundle.main.path(forResource: "MyVideo", ofType: "mp4")
        
        if let path = moviePath{
            let url = NSURL.fileURL(withPath: path)
            let avPlayer = AVPlayer(url: url)
            let playerLayer = AVPlayerLayer(player: avPlayer)
            playerLayer.frame = playerView.bounds
            playerLayer.backgroundColor = UIColor.clear.cgColor
            playerLayer.videoGravity = AVLayerVideoGravityResizeAspect
            playerView.layer.addSublayer(playerLayer)
            avPlayer.play()
        }
    
    }
}
```