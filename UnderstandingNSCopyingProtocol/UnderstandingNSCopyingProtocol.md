# Understanding NSCopying Protocol

### Introduction

There are two main non-primitive data types in Swift:

- Classes
- Structs

They do almost similar kinda things, but a key area of difference between the two is **the way of copying objects**.

With `Classes` two variables can point at the same object, so that changing one changes them both, whereas if you tried that with `Structs`, you'd find that Swift creates a full copy so that changing the copy does not affect the original.

----

Having lots of class objects point at the same data can be useful, but frequently you'll want to modify copies so that modifying one object doesn't have an effect on anything else.

To make this work you need to do three things:

- Make your class conform to `NSCopying` protocol. This isn't strictly required, but it makes your intent clear.
- Implement the method `copy(with:)`, where the actual copying happens.
- Call `copy()` on your object.

----

### Example

**If a class does not conform to NSCopying protocol:**

```
class Contact: NSObject {
    var firstName: String
    var lastName: String
    var age: Int
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
}

let p = Contact(firstName: "Paul", lastName: "Hudson", age: 36)
let s = p

s.firstName = "Sophie"
s.age = 6

print("\(p.firstName) \(p.lastName) is \(p.age)")
print("\(s.firstName) \(s.lastName) is \(s.age)")
```

**Output:**

```
Sophie Hudson is 6
Sophie Hudson is 6
```

----

**If a class conforms to NSCopying protocol:**

```
class Person: NSObject, NSCopying {
    var firstName: String
    var lastName: String
    var age: Int
    
    init(firstName: String, lastName: String, age: Int) {
        self.firstName = firstName
        self.lastName = lastName
        self.age = age
    }
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = Person(firstName: firstName, lastName: lastName, age: age)
        return copy
    }
}

let paul = Person(firstName: "Paul", lastName: "Hudson", age: 36)
let sophie = paul.copy() as! Person

sophie.firstName = "Sophie"
sophie.age = 6

print("\(paul.firstName) \(paul.lastName) is \(paul.age)")
print("\(sophie.firstName) \(sophie.lastName) is \(sophie.age)")
```

**Output:**

```
Paul Hudson is 36
Sophie Hudson is 6
```