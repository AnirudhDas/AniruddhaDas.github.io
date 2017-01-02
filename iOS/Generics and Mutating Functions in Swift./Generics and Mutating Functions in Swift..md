# Generics and Mutating Functions in Swift.

Generic code enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define. You can write code that avoids duplication and expresses its intent in a clear, abstracted manner. Generic functions can work with any data type (primitive or user defined).

```mutating``` keyword is used when a function of a struct, modifies any property defined within the struct.

### Example: A generic stack

```
struct stack<T> {
    var items = [T]()
    mutating func push(item: T) {
        items.append(item)
    }
    
    mutating func pop(item: T) {
        items.removeLast()
    }
}

var tos = stack<String>()
tos.push(item: "Ani")
print(tos.items)
tos.push(item: "Pappu")
print(tos.items)
tos.push(item: "Keshav")
print(tos.items)

tos.pop(item: "Pappu")
print(tos.items)

var intObj = stack<Int>()
intObj.push(item: 10)
print(intObj.items)
```