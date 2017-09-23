# How To Detect Low Power Mode Is Enabled

```
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.

        NotificationCenter.default.addObserver(self, selector: #selector(powerStateChanged), name: Notification.Name.NSProcessInfoPowerStateDidChange, object: nil)
    }
    
    func powerStateChanged(_ notification: Notification) {
        let lowerPowerEnabled = ProcessInfo.processInfo.isLowPowerModeEnabled
        // take appropriate action
        print("Low Power Mode On")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
```