# What is `autorelease pool`?

##### Obj. C and Swift has a class called `NSAutoReleasePool`, which maintains all the objects created within the app, in a pool memory. Every app maintains one such pool. Whenever the app is terminated or killed, the pool is drained or released automatically by the OS. It has a method called `drain()` to do so. In ARC projects, this is internally invoked by iOS.

##### But we can also redefine this on our own.

```
autoreleasepool {
  /* code */ 
}
```