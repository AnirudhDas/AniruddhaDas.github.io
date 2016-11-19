# How to reset singleton instance once it's already created?

Create the Singleton class with an ```optional Singleton instance```. However, also make this ```private``` and use a function to fetch it. If the Singleton is ```nil```, it creates a new instance.

### Sample Code:

```
class Singleton {

    private static var privateShared : Singleton?

    class func shared() -> Singleton {
        guard let uwShared = privateShared else {
            privateShared = Singleton()
            return privateShared!
        }
        return uwShared
    }

    class func destroy() {
        privateShared = nil
    }

    private init() {
        print("init singleton")
    }

    deinit {
        print("deinit singleton")
    }
}
```