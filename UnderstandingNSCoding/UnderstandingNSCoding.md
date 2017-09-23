# Understanding NSCoding

We know that data types like integers, dates, strings, arrays can be stored in `UserDefaults`.

But, you can also save any kind of data inside `UserDefaults` as long as you follow some rules.

You use the `archivedData(withRootObject:)` method of `NSKeyedArchiver`, which turns an object graph into an `Data` object, then write that to `UserDefaults` as if it were any other object. If you were wondering, "object graph" means "your object, plus any objects it refers to, plus any objects those objects refer to, and so on."

**The rules are very simple:**

- All your data types must be one of the following: boolean, integer, float, double, string, array, dictionary, Date, or a class that fits rule 2.
- If your data type is a class, it must conform to the `NSCoding` protocol, which is used for archiving object graphs.
- If your data type is an array or dictionary, all the keys and values must match rule 1 or rule 2.

Many of Apple's own classes support NSCoding like `UIColor`, `UIImage`, `UIView`, `UILabel`, `UIImageView`, `UITableView` and many more.

But your own classes do not, at least not by default. If we want to save the our custom objects to UserDefaults, we'll need to conform to the NSCoding protocol.

```
class Person: NSObject, NSCoding {
    var name: String = ""
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
    }
}
```

And we can use it like:

```
//Create custom objects
let ob1 = Person(coder:NSCoder())
let ob2 = Person(coder:NSCoder())
let ob3 = Person(coder:NSCoder())
var people = [ob1, ob2, ob3]
    
//To store in UserDefaults
let savedData = NSKeyedArchiver.archivedData(withRootObject: people)
let defaults = UserDefaults.standard
defaults.set(savedData, forKey: "people")
    
//To retrieve from UserDefaults
if let savedPeople = defaults.object(forKey: "people") as? Data {
    people = NSKeyedUnarchiver.unarchiveObject(with: savedPeople) as! [Person]
}
```