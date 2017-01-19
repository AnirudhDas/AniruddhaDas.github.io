# Types of Properties in Objective C

1. **atomic vs nonatomic**
2. **strong vs weak**
3. **readwrite vs readonly**
4. **getter= vs setter=**
5. **copy vs assign**
6. **retain vs unsafe_unretained**

----

### atomic

Properties are atomic by default, so if you don’t write nonatomic, it will be atomic (whether you write it or not). Atomic basically ensures that data is written or read atomically. So if thread A is still in the getter when thread B calls the setter, thread A will get a viable value. It is thread-safe, i.e. only one thread can access it at a time. It is much secure than nonatomic. The problem with atomic though, is that it is quite slow compared to its opposite. Also, you must either implement both the setter and the getter, or neither.

----

### nonatomic

This makes no such guarantees about atomicity. If thread A is in the middle of a getter for a nonatomic String, and Thread B tries to set it to “Microwave”, and Thread C tries to set it to “Refrigerator”, you might get “Microgerator”, or it may just be completely unreadable and crash the program. So if you use nonatomic, you must implement your own thread safety and atomicity. It allows multithreading and it is faster, but is not thread safe and not secure.

----

### assign

A pre-ARC attribute. It was used similar to "weak" for pre-ARC programs. This is default behavior for primitive data types (like int, long, and float), and should be limited to properties for primitive types.

It assigns pointer to the same object, but `retain count doesn't increase`. If multiple pointers are pointing to the same object, we can set the pointers one by one to nil, but it's the responsiblity of the last pointer to release the object memory.

----

### copy

It is similar to strong, but instead of increasing the retain count and claiming ownership of an object, it copies the value of the object that it is assigned to, and takes strong ownership of that copy. It creates a new object with different memory address.

```
var ob1 = A() //ob1 points to memory address 100
var ob2 = ob1 //ob2 points to memory address 200
```

----

### readwrite

This is a default attribute and it can be overridden by `readonly`. This basically tells the compiler to generate both getter and setter for a property.

----

### readonly

This `can override readwrite`. It tells the compiler to only generate a getter for an object. So, if you want a property visible to another class, but not able to be changed by an external class, set the property to readonly in your header file (.h file), and in your implementation file (.m file), declare it as readwrite. That way your implementation has a getter and a setter, while external classes only get the getter.

----

### getter=

It is same as `readonly`, but only for boolean value. This just gives a custom name for a getter. The default getter is just the name of the property. For instance for the UISwitch control in iOS, the property that says whether the switch is on is just named “on”. To make things a bit more readable, they set this attribute to “getter=isOn”.

```
if(someSwitch.isOn)
```

----

### setter=

It is same as `readwrite`, but only for boolean value. It just gives a custom name to the setter. The default setter is just the capitalized property name with set as a prefix (so the default setter for “petOwner” is “setPetOwner”. This is again done purely for convenience or readability.

----

### retain

A pre-ARC attribute. This is the older version of "strong". It claims ownership of the object and increases the retain count. You will have to `manually set the pointer variables to nil` to decrease the object's retain count. It will release the object from memory when the retain count goes to 0.

----

### unsafe_unretained

A pre-ARC attribute. This is similar to "weak", but did not automatically set the pointer value to nil, even if the referenced object was destroyed.

It maintains retain count for unretained as well. Even if the reference object is nil, it is not automatically set to nil.

----

### strong

This was introduced in ARC. This is also a default attribute, and must be overridden if you want to change it. In ARC, it's opposite is the “weak” attribute. This increases the retain count (something ARC deals with for you), it basically keeps the object that is pointed to in memory until that class instance stops pointing to it. This is usually what you want, but there it can cause something called a “retain cycle.” The weak attribute helps solve this issue.

----

### weak

This was introduced in ARC. This gives a pointer to an object, but does not claim ownership, and does not increase the retain count. It basically keeps a valid pointer to an object as long as another class points to it strongly. Only one instance of the object exists in memory, and both strong and weak variables points to it. If nothing else is trying to retain it, the weak pointer is automatically set to nil.

The difference between weak and assign is weak supports both primitive and non primitive data types (Custom objects), but assign supports only primitive data types.

The reason why @IBOutlet in iOS is by default `weak` is:
If view is removed, outlet is also removed.
Had the view been weak, and outlet been strong, then when the view is removed, the outlet would remain.

----

#### Note:

For **MacOS applications**, default type of properties is `atomic`, as data consitency and correctness is given more priority.

But for **iOS applications**, default type of properties is `nonatomic`, as performance and speed is given more priority.

----

To read more, refer this [article](http://www.ios-blog.co.uk/tutorials/objective-c/objective-c-property-attribute-reference-guide/).