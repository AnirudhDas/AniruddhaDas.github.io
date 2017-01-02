# Getting Device Location

Write a singleton class for Location.

**LocationManager.swift**

```
import Foundation
import CoreLocation

public class LocationManager: NSObject {

    internal let locMgr = CLLocationManager()
    internal var handlerForLocation: ((CLLocation?) -> Void)?

    override init() {
        super.init()
        self.locMgr.delegate = self
        self.locMgr.desiredAccuracy = kCLLocationAccuracyBest
        self.locMgr.requestWhenInUseAuthorization()
    }

    public class var shared: LocationManager {
        get {
            struct Single {
                static var shared = LocationManager()
            }
            return Single.shared
        }
    }

}

extension LocationManager: CLLocationManagerDelegate {

    public func getLocation(_ handler: @escaping (_ location: CLLocation?) -> Void) {
        self.handlerForLocation = nil
        self.handlerForLocation = handler
        self.locMgr.requestLocation()
    }

    public func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        if self.handlerForLocation != nil {
            self.handlerForLocation?(locations[0])
        }
        self.locMgr.stopUpdatingLocation()
    }

    public func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        if self.handlerForLocation != nil {
            self.handlerForLocation?(nil)
        }
        self.locMgr.stopUpdatingLocation()
    }

}
```

Using the above class. Write this code in your view controller.

**ViewController.swift**

```
LocationManager.shared.getLocation { (location: CLLocation?) in
    print("Location lat=\(location?.coordinate.latitude) and lng=\(location?.coordinate.longitude)")
}
```