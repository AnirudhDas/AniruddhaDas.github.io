# Geo-Coding in iOS

### Forward Geo-Coding

Get Latitude and Longitude from Address.

```
import UIKit
import CoreLocation

class ViewController: UIViewController {

	override func viewDidLoad() {
        super.viewDidLoad()
        forwardGeocoding(address: "Electronic City, Bangalore, India")
    }
    
    func forwardGeocoding(address: String) {
        CLGeocoder().geocodeAddressString(address, completionHandler: { (placemarks, error) in
            if error != nil {
                print(error as Any)
                return
            }
            if (placemarks?.count)! > 0 {
                let placemark = placemarks?[0]
                let location = placemark?.location
                let coordinate = location?.coordinate
                print("\n latitude: \(coordinate!.latitude), longitude: \(coordinate!.longitude)")
            }
        })
    }
}
```

Output:

```
latitude: 12.8451181, longitude: 77.6601386
```

### Reverse Geo-Coding

Get Address from Latitude and Longitude.

```
func reverseGeocodeLocation(location: CLLocation) {
    CLGeocoder().reverseGeocodeLocation(location, completionHandler: {(placemarks, error) -> Void in
        if error != nil {
            print("Reverse geocoder failed with error \(error!.localizedDescription)")
        }
        if (placemarks?.count)! > 0 {
            let pm = placemarks![0]
            if let country = pm.country {
                print("Country is \(country)")
            }
        } else {
            print("Reverse geocoder failed")
        }
    })
}
```

#### Address components

Above code has ```country``` component, which you can replace with any one of the following:

**Location**

```
if let name = pm.name {
    print("name is \(name)")
}
// name is Apple Inc.
```

**Street Name**

```
if let thoroughfare = pm.thoroughfare {
    print("thoroughfare is \(thoroughfare)")
}
// thoroughfare is Infinite Loop
```

**Street Number**

```
if let subThoroughfare = pm.subThoroughfare {
    print("subThoroughfare is \(subThoroughfare)")
}
// subThoroughfare is 1
```

**City**

```
if let locality = pm.locality {
    print("locality is \(locality)")
}
// locality is Cupertino
```

**District**

```
if let subLocality = pm.subLocality {
    print("subLocality is \(subLocality)")
}
// subLocality is Mission District
```

**State**

```
if let administrativeArea = pm.administrativeArea {
    print("administrativeArea is \(administrativeArea)")
}
// administrativeArea is CA
```

**Sub Administrative Area**

```
if let subAdministrativeArea = pm.subAdministrativeArea {
    print("subAdministrativeArea is \(subAdministrativeArea)")
}
// subAdministrativeArea is Santa Clara
```

**Zip Code**

```
if let postalCode = pm.postalCode {
    print("postalCode is \(postalCode)")
}
// postalCode is 95014
```

**Country Code**

```
if let isoCountryCode = pm.isoCountryCode {
    print("isoCountryCode is \(isoCountryCode)")
}
// isoCountryCode is US
```

**Country**

```
if let country = pm.country {
    print("country is \(country)")
}
// country is United States
```

**Inland Water**

```
if let inlandWater = pm.inlandWater {
    print("inlandWater is \(inlandWater)")
}
// inlandWater is Lake Tahoe
```

**Ocean**

```
if let ocean = pm.ocean {
    print("ocean is \(ocean)")
}
// ocean is Pacific Ocean
```

**Areas of Interest**

```
if let areasOfInterest = pm.areasOfInterest {
    print("areasOfInterest is \(areasOfInterest)")
}
// areasOfInterest is Golden Gate Park
```