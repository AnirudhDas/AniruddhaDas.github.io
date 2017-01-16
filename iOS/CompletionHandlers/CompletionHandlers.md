# Completion Handlers in Swift

Completion Handlers are used for one-to-one communication. It means the response comes back only in that calling method, where the closure was called. It is an alternative to delegates, with the difference being closures perform asynchronously (on a different thread), while delegates performs the operation on the same thread.

### Example:

Define a function as:

```
func addition(x: Int, y: Int, completionHandler: @escaping (_ result: Int) -> Void){
        let result = x + y
        return handler(result)
}
```

**Note:** Completion Handlers returns `Swift.Void` type.

And call it like:

```
addition(x: 10, y: 10, completionHandler: { (result) in
    print("Addition is\(result)")
})
```

Or we can even drop the `completionHandler`:

```
addition(x: 10, y: 10) { (result) in
    print("Addition is\(result)")
}
```

### Other Examples:

Popular uses of completion handler are during API calls.

Declaration:

```
open func dataTask(with request: URLRequest, 
  completionHandler: @escaping (Data?, URLResponse?, Error?) -> Swift.Void
  ) -> URLSessionDataTask
```

Usage:

```
let task = session.dataTask(with: urlRequest) { (data, response, error) in
  // this is where the completion handler code goes
  if let response = response {
    print(response)
  }
  if let error = error {
    print(error)
  }
}
task.resume()
```

### When does a completion handler get called?

A completion handler gets called only when the function execution is complete and it has to return some value back to the calling function. Till the function execution is not complete, it does not block the main thread. The completion handler is the code where we can work with the results of the call: `error checking`, `saving the data locally`, `updating the UI`, etc.