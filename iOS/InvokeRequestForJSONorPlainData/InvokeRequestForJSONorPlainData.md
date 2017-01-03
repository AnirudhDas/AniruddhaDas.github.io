# Invoke request for JSON data or Plain data

### Invoke request for JSON data

```
class func invokeRequestForJSON(request:NSMutableURLRequest, Handler:(AnyObject?, NSString?) -> Void) -> NSURLSessionDataTask {
    request.timeoutInterval = 20
    let task =  NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in
        do {
            if let responseData = data {
                let responseObject = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments)
                return Handler(responseObject, nil)
            } else {
                Handler(nil, "Invalid response received")
            }
        } catch {
            print(error)
            Handler(nil, "Invalid JSON Request received\n\(error)")
        }
    })
    task.resume()
    return task
}
```

### Invoke request for Plain data

```
class func invokeRequestForData(request:NSMutableURLRequest, Handler:(NSData?, NSString?) -> Void) -> NSURLSessionDataTask {
    request.timeoutInterval = 20
    let task =  NSURLSession.sharedSession().dataTaskWithRequest(request, completionHandler: { (data:NSData?, response:NSURLResponse?, error:NSError?) -> Void in

        if let r = error {
            Handler(nil, r.localizedDescription)
        } else if let dataReceived = data {
            Handler(dataReceived, nil)
        } else {
            Handler(nil, "Some error occured")
        }
    })
    task.resume()
    return task
}
```