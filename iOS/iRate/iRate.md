# Integrate iRate in your app

**Step 1.**

Create a ```Podfile``` & add the following pod as follows:

```
pod 'iRate'
```

**Step 2.**

Install Pod by ```pod install``` command & open `YourApp-Bridging-Header.h` & import iRate library as follows:

```
#import <iRate/iRate.h>
```

**Step 3.**

Open ```AppDelegate.swift```. In the `didFinishLaunchingWithOptions` method, write this piece of code:

```
iRate.sharedInstance().applicationBundleID = "com.yourcompany.yourapp" 
iRate.sharedInstance().cancelButtonLabel = nil
iRate.sharedInstance().daysUntilPrompt = 5
iRate.sharedInstance().usesUntilPrompt = 15
```

**Step 4.**

To launch ```App Rating```, put code as follows:

```
func rateThisApp() {
    iRate.sharedInstance().openRatingsPageInAppStore()
}
```