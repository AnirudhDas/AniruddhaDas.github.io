# Integrating Reachability in iOS

### Step 1

Download and drag-n-drop `Reachability.swift` class into your project.

[Reachability.swift](Reachability.swift)

### Step 2

Define a class called `RechabilityChecker.swift`.

```
import Foundation

public class RechabilityChecker: NSObject {

    let reachability = Reachability()!

    override init() {
        super.init()
        reachability.whenReachable = { reachability in
            performUIUpdatesOnMain({
                if reachability.isReachableViaWiFi {
                    print("Reachable via WiFi")
                } else {
                    print("Reachable via Cellular")
                }
            })
        }

        reachability.whenUnreachable = { reachability in
            performUIUpdatesOnMain({
                print("Not reachable")
            })
        }

        do {
            try reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }

    public class var shared: Reachability {
        get {
            struct Single {
                static var shared = RechabilityChecker()
            }
            return Single.shared.reachability
        }
    }

}
```

### Step 3

Use it in your ViewController as:

```
if ReachabilityChkr.shared.isReachableViaWiFi == true || ReachabilityChkr.shared.isReachableViaWWAN == true {
    print("Connected to Internet")    
} else {
    print("NOT Connected to Internet")
}
```