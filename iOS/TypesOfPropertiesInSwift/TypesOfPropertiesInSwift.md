# Types of Properties in Swift

1. **Stored**
2. **Computed**

Properties refer to Fields/Attributes of a class, struct or enum.

`Stored properties` store constant and variable values as part of an instance, whereas computed properties calculate (rather than store) a value.

`Computed properties` are provided by classes, structures, and enumerations. Stored properties are provided only by classes and structures.

Whenever you want to store a value in a variable you need to use a `stored property`.

A `computed property` can be used to provide a different view of a stored property.

**Example of a stored property:**

```
var age:Int
```

**Example of a computed property:**

```
var isOfLegalDrinkingAge: Bool {
    return age >= 21
}
```

To read more, refer this [article](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html).

----

### Lazy Stored Property

A `lazy stored property` is a property whose initial value is not calculated until the first time it is used. You indicate a lazy stored property by writing the lazy modifier before its declaration.

**Example 1:**

```
class DataImporter {
    /*
     DataImporter is a class to import data from an external file.
     The class is assumed to take a non-trivial amount of time to initialize.
     */
    var fileName = "data.txt"
    // the DataImporter class would provide data importing functionality here
}
 
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
    // the DataManager class would provide data management functionality here
}
 
let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property has not yet been created

print(manager.importer.fileName)
// the DataImporter instance for the importer property has now been created
// Prints "data.txt"
```

**Example 2:**

```
func fibonacci(of num: Int) -> Int {
    if num < 2 {
        return num
    } else {
        return fibonacci(of: num - 1) + fibonacci(of: num - 2)
    }
}

struct Person {
    var age = 16

    lazy var fibonacciOfAge: Int = {
        return fibonacci(of: self.age)
    }()
}

var singer = Person()
singer.fibonacciOfAge
```

Remember, the point of lazy properties is that they are computed only when they are first needed, after which their value is saved. This means if you create 1000 singers and never touch their fibonacciOfAge property, your code will be lightning fast because that lazy work is never done.

**There are five important things to note in that code:**

- The lazy property is marked as lazy var. You can't make it lazy let because lazy properties must always be variables.
- Because the actual value is created by evaluation, you need to declare its data type up front. In the case of the code above, that means declaring the property as Int.
- Once you've set your data type, you need to use an open brace ("{") to start your block of code, then "}" to finish.
- You need to use self inside the function. In fact, if you're using a class rather than a structure, you should also declare [unowned self] inside your function so that you don't create a strong reference cycle.
- You need to end your lazy property with (), because what you're actually doing is making a call to the function you just created.

To read more, refer this [article](https://www.hackingwithswift.com/example-code/language/what-are-lazy-variables).

----

### Property Observers

Property observers observe and respond to changes in a property’s value. Property observers are called every time a property’s value is set, even if the new value is the same as the property’s current value.

You have the option to define either or both of these observers on a property:

- `willSet` is called just before the value is stored.
- `didSet` is called immediately after the new value is stored.

**Example:**

```
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps
```

The point seems to be that sometimes, you need a property that has automatic storage and some behavior, for instance to notify other objects that the property just changed. When all you have is `get`/`set`, you need another field to hold the value. With `willSet` and `didSet`, you can take action when the value is modified without needing another field.

For instance, in that example:

```
class Foo {
    var myProperty: Int = 0 {
        didSet {
            print("The value of myProperty changed from \(oldValue) to \(myProperty)")
        }
    }
}
```

`myProperty` prints its old and new value every time it is modified.

Whereas, with just getters and setters, I would need this instead:

```
class Foo {
    var myPropertyValue: Int = 0
    var myProperty: Int {
        get { return myPropertyValue }
        set {
            myPropertyValue = value
            print("The value of myProperty changed from \(oldValue) to \(myProperty)")
        }
    }
}
```

So `willSet` and `didSet` represent an economy of a couple of lines, and less noise in the field list.

To read more, refer this [article](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Properties.html).