# Dispatch Queue/GCD VS NSOperationQueue

Both are means to achieve multi-threading in iOS.

While ```NSOperationQueue``` have been available since iOS 2, ```Grand Central Dispatch``` was introduced in iOS 4.

With the introduction of Grand Central Dispatch, Apple refactored NSOperation to work on top of Grand Central Dispatch. The NSOperation API is a higher level abstraction of Grand Central Dispatch. If you are using NSOperation today, then you are implicitly/indirectly using Grand Central Dispatch.

```Grand Central Dispatch``` is a low-level ```C API``` that interacts directly with Unix level of the system. ```NSOperation``` is an ```Objective-C API``` and that brings some overhead with it. Instances of NSOperation need to be allocated before they can be used and deallocated when they are no longer needed. Even though this is a highly optimized process, it is inherently slower than Grand Central Dispatch, which operates at a lower level.

### Dispatch Queue/GCD:

* GCD (Grand Central Dispatch) is a lightweight way to represent units of work that are going to be executed concurrently. You don’t need to schedule these units of work; the system takes care of scheduling for you. But, adding dependency among blocks, or canceling and suspending a block can't be achieved.

* GCD dispatch queues are better for short tasks that should have minimum performance and less memory overhead.

### NSOperationQueue:

* NSOperation and NSOperationQueue add a little extra overhead compared to GCD, but you can add dependency among various operations. You can re-use operations, cancel or suspend them. NSOperation is compatible with Key-Value Observation (KVO); for example, you can have an NSOperation start running by listening to NSNotificationCenter.

* NSOperationQueue can be more suitable for long-running/complex operations that may need to be cancelled or have complex dependencies.

* NSOperationQueue supports two types of operations:
	1. Block Operation - Executes a block/function and has a completion handler, i.e. it returns some value to it's caller.
	2. Invocation Operation - Simply executes a block/function.

### Benefits of NSOperationQueue:

Since NSOperation is built on top of Grand Central Dispatch, you may be wondering what NSOperation offers that Grand Central Dispatch doesn’t. There are several compelling benefits that make NSOperation an interesting choice for a number of use cases.

* ```Dependencies``` -
The NSOperation API provides support for dependencies. This is a powerful concept that enables developers to execute tasks in a specific order. An operation is ready when every dependency has finished executing.

* ```Observable``` -
The NSOperation and NSOperationQueue classes have a number of properties that can be observed, using KVO (Key Value Observing). This is another important benefit if you want to monitor the state of an operation or operation queue.

* ```Pause, Cancel, Resume``` -
Operations can be paused, resumed, and cancelled. Once you dispatch a task using Grand Central Dispatch, you no longer have control or insight into the execution of that task. The NSOperation API is more flexible in that respect, giving the developer control over the operation’s life cycle.

* ```Control``` -
The NSOperationQueue also adds a number of benefits to the mix. For example, you can specify the maximum number of queued operations that can run simultaneously. This makes it easy to control how many operations run at the same time or to create a serial operation queue.

### Working with Dispatch Queue:

```
DispatchQueue.main.async {
   // do stuff here
}
```

### Working with Operation Queue:

```
OperationQueue.main.async {
   // do stuff here
}
```

### When to chose what:

Prefer GCD where task is ```not much complex``` and ```optimum CPU performance``` is required.
Prefer NSOperationQueue where task is ```complex``` and requires ```canceling or suspending a block``` and ```dependency management```.

In general, Apple advises developers to use the highest level of abstraction that is available. If we apply this advice, then the ```NSOperation API``` should be your first choice.

But why does Apple advise developers to use the highest level of abstraction? With every release, Apple tweaks and optimizes the frameworks and libraries that power the operating system. This usually involves changes affecting low(er)-level APIs. Even though APIs built on top of these low-level APIs change less frequently, they still benefit from the improvements Apple makes to the APIs they are built on.

Great. But when do you use which technology? Should you avoid Grand Central Dispatch only because it is a low-level API? You can use Grand Central Dispatch whenever and wherever you like. Many developers swear by Grand Central Dispatch, but most developers use a combination NSOperation and Grand Central Dispatch.

### Note:

Ques: How to handle Multi-threading using NSOperationQueue?

Ans: We can add dependency of each operation as per requirement, so we can achieve multithreading.

### Refer

1. [CocoaCasts Article](https://cocoacasts.com/choosing-between-nsoperation-and-grand-central-dispatch/).
2. [AppCoda Article](http://www.appcoda.com/ios-concurrency/)