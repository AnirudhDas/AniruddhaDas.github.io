# Draw path between two points on google maps for iOS

Make sure that you install the pod **```ADConnectionManager```**.

In your `view controller`, write this:

```
import UIKit
import ADConnectionManager
import GoogleMaps

class ViewController: UIViewController {
    var mapView: GMSMapView?
    override func viewDidLoad() {
        super.viewDidLoad()

        let camera = GMSCameraPosition.cameraWithLatitude(-33.86,
            longitude: 151.20, zoom: 6)
        self.mapView = GMSMapView.mapWithFrame(CGRectZero, camera: camera)
        self.mapView?.myLocationEnabled = true
        self.mapView?.settings.compassButton = true
        self.mapView?.settings.indoorPicker = true

        self.view = mapView

        let strHome = ADConnectionManager.addURLEncoding("Sunny Side apartment, Hadosiddapura, Sarjapur road, Bangalore")
        let strOffice = ADConnectionManager.addURLEncoding("Embassy TechVillage, Bellandur, Bangalore")
        let str = "https://maps.googleapis.com/maps/api/directions/json?origin=\(strHome)&destination=\(strOffice)&key=YOUR_GOOGLE_SERVER_KEY" 

        ADConnectionManager.invokeRequestForJSON(NSMutableURLRequest(URL: NSURL(string: str)!)) { (obj:AnyObject?, error:NSString?) -> Void in
            if let r = error {
                print("Error occured \(r)")
            } else if let objD = obj as? NSDictionary {
                print("Response in dictionary form \(objD)")
                self.parseAndDisplayDirection(objD)
            } else if let objA = obj as? NSArray {
                print("Response in array form \(objA)")
            }
        }
    }

    func parseAndDisplayDirection(objD:NSDictionary) {
        if let routes = objD.valueForKey("routes") as? NSArray {
            if let routesD = routes.objectAtIndex(0) as? NSDictionary {

                if let legs = routesD.valueForKey("legs") as? NSArray {
                    if let legs0 = legs.objectAtIndex(0) as? NSDictionary {
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            let endAddress = legs0.valueForKey("end_address") as! String
                            let startAddress = legs0.valueForKey("start_address") as! String
                            let startLoc = legs0.valueForKey("start_location") as! NSDictionary
                            let endLoc = legs0.valueForKey("end_location") as! NSDictionary
                            let startCoOd = CLLocationCoordinate2D(latitude: startLoc.valueForKey("lat") as! Double, longitude: startLoc.valueForKey("lng") as! Double)
                            let endCoOd = CLLocationCoordinate2D(latitude: endLoc.valueForKey("lat") as! Double, longitude: endLoc.valueForKey("lng") as! Double)

                            let startMarker = GMSMarker(position: startCoOd)
                            let endMarker = GMSMarker(position: endCoOd)
                            startMarker.title = startAddress.componentsSeparatedByString(",")[0]
                            endMarker.title = endAddress.componentsSeparatedByString(",")[0]
                            startMarker.map = self.mapView
                            endMarker.map = self.mapView
                            let bounds = GMSCoordinateBounds(coordinate: startCoOd, coordinate: endCoOd)
                            self.mapView?.animateWithCameraUpdate(GMSCameraUpdate.fitBounds(bounds))
                        })
                    }
                }

                if let polyLine = routesD.valueForKey("overview_polyline") as? NSDictionary {
                    if let points = polyLine.valueForKey("points") as? String {
                        NSOperationQueue.mainQueue().addOperationWithBlock({ () -> Void in
                            let path = GMSPath(fromEncodedPath: points)
                            let line = GMSPolyline(path: path)
                            line.map = self.mapView
                        })
                    }
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
```