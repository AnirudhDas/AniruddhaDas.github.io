# Using SDWebImage To Download And Cache Image From URL

```
import UIKit
import SDWebImage

class ViewController: UIViewController {

	let imageUrl = "https://www.website.com/myimage.png"
	
	let placeholderImageName = "placeholder.png"
	
	@IBOutlet weak var albumArtImgView: UIImageView!

	override func viewDidLoad() {
	   	super.viewDidLoad()
		self.albumArtImgView.sd_setImage(with: URL(string: ), placeholderImage: UIImage(named: self.imgUrlString), options: [.continueInBackground, .progressiveDownload])
	}
}
```