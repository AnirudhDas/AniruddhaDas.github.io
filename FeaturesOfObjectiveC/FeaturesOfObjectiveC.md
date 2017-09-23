# Features of Objective C


### Method Swizzling / Dynamic Method Resolution

Method Swizzling is the technique where we can change the method calling at run time by using `@Selector`.

Basically, at runtime you can swap out one implementation of a method with another.

One clever use case is for lazy loading of a shared resource: usually you would implement a `sharedFoo` method by acquiring a lock, creating the `foo` if needed, getting its address, releasing the lock, then returning the `foo`. This ensures that the `foo` is only created once, but every subsequent access wastes time with a lock that isn't needed any more.

With method swizzling, you can do the same as before, except once the `foo` has been created, use swizzling to swap out the initial implementation of `sharedFoo` with a second one that does no checks and simply returns the foo that we now know has been created!

----

### How can we get the properties of class at runtime?

We have to `import <objc/runtime.h>`.

We can get the class properties at run time using:

```
Objc_property_t *proprties = class_copyPropertyList([self class])
```

### Have you used objective c at runtime?

YES. For setting class property at runtime.

----
	
### Posing

Objective-C permits a class to entirely replace another class within an application. The replacing class is said to `"pose as"` the target class. All messages sent to the target class are then instead received by the posing class. 

**There are some restrictions on which classes can pose:**

- A class may only pose as one of its direct or indirect superclasses.
- The posing class must not define any new instance variables which are absent from the target class (though it may define or override methods).
- `No messages must have been sent to the target class prior to the posing.
- Posing, similarly to categories, allows globally augmenting existing classes.

**Posing permits two features absent from categories:**

- A posing class can call overridden methods through super, thus incorporating the implementation of the target class.
- A posing class can override methods defined in categories.

----

### Object Forwarding / Method Missing

When an object is sent a message for which it has no method, the runtime system gives it another chance to handle the call before giving up. If the object supports a `-forward::` method, the runtime calls this method, passing it information about the unhandled call. The return value from the forwarded call is propagated back to the original caller of the method.

----

### ISA Switching

Need to override all of an object's behaviors? You can actually change the class of an active object with a single line of code:

```
obj->isa = [NewClass class];
```

This only changes the class that receives method calls for that object; it doesn't change the object's layout in memory. Thus, this is only really useful when you have a set of classes with the same ivars (or one with a subset of the others) and you want to switch between them.

----

### What is use of @dynamic?

@dynamic is used at runtime, for setting class properties. It instructs to the compiler to set it's value at runtime.

----

### What is @protocol?

@protocol is same as Interface of java. We declare a protocol in iOS with @protocol.