# Dispatch Queue/GCD VS NSOperationQueue

### Dispatch Queue/GCD:

* GCD is a lightweight way to represent units of work that are going to be executed concurrently. You don’t schedule these units of work; the system takes care of scheduling for you. Adding dependency among blocks can be a headache. Canceling or suspending a block creates extra work for you as a developer!

* It is possible to cancel operations that have been enqueued in an NSOperationQueue (as far as the operations support it). When you enqueue a block in a GCD dispatch queue, it will definitely be executed at some point.

### NSOperationQueue:

* NSOperation and NSOperationQueue add a little extra overhead compared to GCD, but you can add dependency among various operations. You can re-use operations, cancel or suspend them. NSOperation is compatible with Key-Value Observation (KVO); for example, you can have an NSOperation start running by listening to NSNotificationCenter.

* NSOperationQueue can be more suitable for long-running operations that may need to be cancelled or have complex dependencies. GCD dispatch queues are better for short tasks that should have minimum performance and memory overhead.

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