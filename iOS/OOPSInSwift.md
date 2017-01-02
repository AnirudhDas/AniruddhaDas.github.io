# Object Oriented Programming in Swift

### Overview

Object-oriented programming (OOP) is a programming paradigm that represents the concept of “objects” that have data fields (attributes that describe the object) and associated procedures known as methods. Objects, which are usually instances of classes, are used to interact with one another to design applications and computer programs.

There are **4 key aspects of object oriented programming**:

- `Encapsulation` means that objects keep their state information private. Rather than directly manipulating an object’s data, other objects send requests to the object, in the form of messages, some of which the object may respond to by altering its internal state. It's basically about hiding the state of an object with the help of modifiers like private, public, protected, etc. We can expose it's state through public methods, only if required.

- `Polymorphism` means that objects of different classes can be used interchangeably. This is especially important, as it allows you to hook up classes at a later date in ways you didn’t necessarily foresee when those classes were first designed. The two different flavours of polymorphism are Overloading and Overriding.

- `Inheritance` means that objects of one class can derive part of their behavior from another (base or parent) class. Some object-oriented languages (C++, for example, but not Swift) allow multiple inheritance, where objects of one class can derive part or all of their behavior from multiple independent base classes.

- `Abstraction` means to hide certain details and only show the essential features of the object. In other words, it deals with the outside view of an object. A good example of Abstraction is interface.

### Classes and Objects

In object-oriented programming, a class is an extensible program-code-template for creating objects, providing initial values for state (member variables) and implementations of behavior (member functions, methods). In other words, a class is like a blueprint, it defines the data and behavior of a type.

```
class Button {
}
```

The definition above creates an empty class named `Button`. The only thing it can do is create new `Button` objects:

```
var button = Button()
```

In the example above, `button` is an instance of the `Button` class.

Properties
Classes and instances can have associated values named properties.

class Square {
    var length: Int = 1
}
The Square class has a length property that has a default value of 1.

In order to create squares with a different length than 1 we need to write a custom initializer.

class Square {
    var length: Int = 1

    init(length: Int) {
        self.length = length
    }
}

var firstSquare = Square(length: 3)
println(firstSquare.length)

var secondSquare = Square(length: 10)
println(secondSquare.length)

if firstSquare.length < secondSquare.length {
    println("the small square has the length \(firstSquare.length)")
} else {
    println("the small square has the length \(secondSquare.length)")
}

Methods
Methods add behaviour to classes and instances.

class Square {
  var length: Int = 1


  func area() -> Int {
    return length * length
  }
}
The area() method computes the area of a Square instance when called. To call a method use the . notation.

var square = Square(5)

println(square.area()) // prints 25

sqare.length = 10

println(square.area()) // prints 100

Class Properties
The usual use of properties are instance properties, like the length of a Square. You can also have a properties. Below is an example use of class properties. The Tank class has a computed property named bonusDamage that is used to increase the damage for all tanks when upgrading. When an upgrade is complete all we need to do is callTank.upgrade() and all Tank instances will have more damage.

class Tank {
    class var bonusDamage: Double {
        return Double(Upgrade.level) * 2.5
    }

    let baseDamage = 10.0

    var damage: Double {
        return self.baseDamage + Tank.bonusDamage
    }

    class func upgrade() {
        Upgrade.level += 1
    }

    struct Upgrade {
        static var level = 0
    }
}

var tank = Tank()

println(tank.damage)
// 10.0

Tank.upgrade()

println(tank.damage)
// 12.5

Tank.upgrade()

println(tank.damage)
// 15.0
Inheritance
A class can inherit methods, properties, and other characteristics from another class. When one class inherits from another, the inheriting class is known as a subclass, and the class it inherits from is known as its superclass. Inheritance is a fundamental behavior that differentiates classes from other types in Swift.

A simple example of inheritance:

class AClass {
    func doSomething() {
        println("Hello from AClass")
    }
}

class Subclass: AClass  {
}

let base_object = AClass()
base_object.doSomething()
//> Hello from AClass


let enhanced_object = Subclass()
enhanced_object.doSomething()
// > Hello from AClass

Overriding
You can override methods in order to provide custom behaviour. To override a method write the override keyword before the method declaration:

class AClass {
    func doSomething() {
        println("Hello from AClass")
    }
}

class Subclass: AClass  {
    override func doSomething() {
        println("Hello from Subclass")
    }
}

let base_object = AClass()
base_object.doSomething()
//> Hello from AClass


let enhanced_object = Subclass()
enhanced_object.doSomething()
//> Hello from Subclass

You can use the super keyword to call any method from the superclass.

...

class Subclass: AClass  {
    override func doSomething() {
        super.doSomething()

        println("Hello from Subclass")
    }
}

let enhanced_object = Subclass()
enhanced_object.doSomething()
//> Hello from AClass
//> Hello from Subclass
Base class
A class that does not inherit from another class is called a base class, for example:

class User {
    var name: String!
    var age: Int!

    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
}
The iOS and Mac OS classes usually inherit from NSObject, either directly or indirectly. If you have a mixt codebase I would encourage you to subclass NSObject when creating a new class:

Swift classes that are subclasses of NSObject:

are Objective-C classes themselves
use objc_msgSend() for calls to (most of) their methods
provide Objective-C runtime metadata for (most of) their method implementations
Swift classes that are not subclasses of NSObject:

are Objective-C classes, but implement only a handful of methods for NSObject compatibility
do not use objc_msgSend() for calls to their methods (by default)
do not provide Objective-C runtime metadata for their method implementations (by default)
Subclassing NSObject in Swift gets you Objective-C runtime flexibility but also Objective-C performance. Avoiding NSObject can improve performance if you don’t need Objective-C’s flexibility.