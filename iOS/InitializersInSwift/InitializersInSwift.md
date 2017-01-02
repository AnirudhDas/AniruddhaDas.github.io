# Designated and Convenience initializers

### Designated Initializers

- Designated initializers are the main initializers to be used for a class.
- A class must have one designated initializer, but it is not limited to one.
- It can have multiple if necessary, but most classes only have one.
- It appears by default, and needs no keyword.

```
init(sender: String, name: String) {
    self.sender = sender
    self.name = name
}
```

### Convenience Initializers

- Convenience initializers are used to make initialization a bit easier.
- Convenience initializers call designated initializers internally.
- It needs keyword 'convinience' infront of it.
- It is Swift's way of achieving constructor overloading.

```
convenience init(sender: String) {
    self.init(sender: sender, recipient: "Anirudh")
}
```

- Designated initializers tend to set all of the properties up and let the user send in values for each. A convenience initializer often has some of those hard coded, and thus can take less parameters. The developer usually write’s a convenience initializer to set some defaults that are appropriate to a special use case.

### Rules for Designated and Convenience Initializers

1. A designated initializer must call a designated initializer from its immediate superclass.
2. A convenience initializer must call another initializer from the same class.
3. A convenience initializer must ultimately call a designated initializer. It can call any number of convinience inits, but the call must eventually end at a designated init.
4. A designated initializer can occur without any convenience initializer. But a convenience initializer must have a designated initializer to occur.


### Example

```
class A {
    var a: Int = 0
    var b: String = ""
    init(a: Int, b: String) {
        self.a = a
        self.b = b
    }
    
    convenience init(a: Int) {
        self.init(a:a, b:"Shri")
    }
    convenience init() {
        self.init(a:10)
    }
}
var objA = A()
var objB = A(a: 10)
var objC = A(a: 20, b: "Anni")

print(objA.a)
print(objA.b)

print(objB.a)
print(objB.b)

print(objC.a)
print(objC.b)
```