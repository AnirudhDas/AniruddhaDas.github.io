# Difference between `Embedded Binaries` and `Linked Frameworks and Libraries`

### Terminology

- **Static VS Dynamic Frameworks**

	Static frameworks are linked at compile time. When you think of linkage with a static library, what happens is pretty clear: the linker copies the code from the library (e.g. libFoo.a) into your output binary at link time after compilation. Your output file grows in size but doesn't need to resolve any external dependencies at runtime. Everything your program needs to run (with respect to the static library) is present after it is built. If you’ve ever used a non-Apple framework prior to iOS 8, you were using a static framework which was compiled into the source code of your app.
	
	Dynamic frameworks are linked at runtime, and can be modified without relinking. With a dynamic library (.dylib, or system-supplied framework), the expectation is that the library you are linking against will be present somewhere in the system's dynamic-library loader path when you run your program. This way you don't have the overhead of copying all the third party external libraries into your binary, and all the different programs on a computer that also link to that library will be able to find it, which saves minimally disk space, but also potentially memory space, depending on how and where the system caches libraries.
	
- **Embedded VS System Frameworks**

	Embedded frameworks are placed within an app’s sandbox and are only available to that app.
	
	System frameworks are stored at the system-level and are available to all apps. Apple reserves the ability to create system frameworks for itself; there is currently no way for third-party developers to create system frameworks on iOS.

- **Thin VS Fat Frameworks**

	Thin frameworks contain compiled code for one architecture.
	
	Fat frameworks contain compiled code for multiple architectures. Compiled code for an architecture within a framework is typically referred to as a “slice.” For example, if a framework had compiled code for just the two architectures used by the Simulator (i386 and x86_64), we would say it contained two slices. If we distributed this framework, it would only work when its consumer was built for the Simulator and would fail when the consumer was built for device. In order to ensure our frameworks can be consumed properly, we must also include the device architectures (currently arm64, armv7 and armv7s) for a total of five slices.

----

Whenever we drag and drop any third party library or framework into our project, we usually get two options for how the linker should attach the binary of the library into your object code.

- Linked Frameworks and Libraries
- Embedded Binaries

----

Embedding binaries copies the entire framework to the target. For building for iOS/tvOS/watchOS, Apple has been strict in not allowing that the frameworks bundled are "fat" (that means that the libraries are built for multiple architectures: arm+i386+x86_64 for example) for keeping the binary sizes low.
That is why you should only link the frameworks, but not embed them in iOS, instead you add a run script phase that copies the framework stripping the data that does not belong to the target.

**Link binary with libraries:** Link frameworks and libraries with your project’s object files to produce a binary file. You can link a target’s source files against libraries in the target’s active SDK or against external libraries.

**Embed Frameworks:** You can create an embedded framework to share code between your app extension and its containing app.

**Linking-** We must link a framework if we use any API defined in it.

**Embedding-** This process will ensure the added framework will be embedded within the App bundle, and potentially will help sharing code between the app, and any extension bundles. We embed only third party frameworks and not the ones provided by iOS as they are readily available in the device. **If we are embedding, that means that, we will need to link to them too so that Xcode can compile and create the build.** When the app runs in the device, then the embedded framework will be loaded into memory when needed.

If you embed the binary it will be included into your product. If you only link a library or framework without embedding it, it will not be part of your product.

However, in iOS 8, all 3rd party frameworks need to be "embedded". Even a framework that is shared between various programs needs to be "embedded" into every single of those programs. In the case it was installed on the device in a shared location, any other installation process using the same "embedded" code from the shared location can re-use that existing installation. This is specific to iOS8, it has not been possible before iOS8 and outside the iOS world this answer would not be accurate.

----

### Refer

- [https://hacking-ios.cocoagarage.com/working-with-a-static-library-framework-vs-embedded-framework-9ca7cd77b4f9#.a3po6lvmw](https://hacking-ios.cocoagarage.com/working-with-a-static-library-framework-vs-embedded-framework-9ca7cd77b4f9#.a3po6lvmw)

- [http://stackoverflow.com/questions/32675272/when-should-we-use-embedded-binaries-rather-than-linked-frameworks-in-xcode](http://stackoverflow.com/questions/32675272/when-should-we-use-embedded-binaries-rather-than-linked-frameworks-in-xcode)

- [http://stackoverflow.com/questions/32375687/what-is-the-difference-between-embedded-binaries-and-linked-frameworks](http://stackoverflow.com/questions/32375687/what-is-the-difference-between-embedded-binaries-and-linked-frameworks)

- [http://code.hootsuite.com/an-introduction-to-creating-and-distributing-embedded-frameworks-in-ios/](http://code.hootsuite.com/an-introduction-to-creating-and-distributing-embedded-frameworks-in-ios/)