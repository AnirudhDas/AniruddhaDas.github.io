# Core Data and Concurrency

#### In Core Data, Thread ‘A’ accesses the NSManagedObject property ‘Name’ and Thread ‘B’ tries to set it to nil at the same time in multi-threading. i) Is this possible? ii) If Yes then how, if NO then Why?

No. Two threads can't access the same NSManagedObject property. A NSManagedObject ```"Name"``` can only be used in the same queue it was created.

### Core Data and Thread-Safety

CoreData framework is ```not thread-safe```. This means that it can't be used in any other thread but the main one.

But there are exceptions in Core Data. In some cases it allows us to use it in a background queue.

Here are a few things that I would love to perform in a background queue:

- Importing large sets of objects into the database without blocking the user interface
- Downloading new objects from a REST service and inserting them into the db.
- Saving datasets in the background since saving can take a user-perceivable amount of time.

Saying that Core Data is not thread safe is a half-truth... and therefore a whole lie. The real situation is as follows:

Certain classes, notably NSManagedObject and NSManagedObjectContext, can only be used in the same queue they were created.

The bottom line is: if you create a context in the main queue, you can only use it in the main queue. If you use it in another queue, you deserve all the bad things that will happen to your app.

It’s the NSManagedObject that owns a queue, and makes sure that all its code runs in that correct queue.

### Refer

1. [CocoaCasts Article](https://cocoacasts.com/core-data-and-concurrency/).
2. [Udacity Article](https://classroom.udacity.com/courses/ud325/lessons/8145303510/concepts/81809789830923#)