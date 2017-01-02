# CocoaPods VS Carthage

Both are dependency managers, and both expose the source code of the component.

However there are few important differences bwtween them:

1. With CocoaPods, your component is publicly discoverable by any developer in the world from ```cocoapods.org```. So anyone can install the pod to checkout your component into their project. It is a centralized dependency manager.

	But with Carthage, someone can only check out your component, if they have a reference to your code repository. It is not publicly discoverable. It is a decentralized dependency manager. It builds your dependencies and provides you with binary frameworks.

2. Whenenver you install a pod, it creates a seperate .xcworkspace, which changes some of your project settings. Also it adds the source code files into your project. You can make changes to these source files.

	Whereas, with carthage, when you check out a component, it checks out the source code along with a compiled framework, in a seperate directory, not within your project. It doesn't make any change to your project setings. You need to drag and drop this framework into your project to use it.
	
3. Cocoapods has ```swift-compatible``` code. But, Carthage is in the form of Objective-C framework. It auto-converts Swift code to Objective-C code internally. So the features of Swift that are not supported by Objective-C or can't be converted to Objective-C, can't be used as Carthage.

	Example: Associative Enums, Tuples
	
### Conclusion

CocoaPods is a long-standing dependency manager for Cocoa. So why was Carthage created?

Firstly, CocoaPods (by default) automatically creates and updates an Xcode workspace for your application and all dependencies. Carthage builds framework binaries using xcodebuild, but leaves the responsibility of integrating them up to the user. CocoaPods’ approach is easier to use, while Carthage’s is flexible and unintrusive.

By contrast, Carthage has been created as a decentralized dependency manager. There is no central list of projects, which reduces maintenance work and avoids any central point of failure. However, project discovery is more difficult—users must resort to GitHub’s Trending pages or similar.

CocoaPods projects must also have what’s known as a podspec file, which includes metadata about the project and specifies how it should be built. Carthage uses xcodebuild to build dependencies, instead of integrating them into a single workspace, it doesn’t have a similar specification file but your dependencies must include their own Xcode project that describes how to build their products.

Ultimately, we created Carthage because we wanted the simplest tool possible—a dependency manager that gets the job done without taking over the responsibility of Xcode, and without creating extra work for framework authors. CocoaPods offers many amazing features that Carthage will never have, at the expense of additional complexity.

### Note:

1. Carthage has to be a ```shared framework```.
	
2. Carthage also checkouts all the source code files into "Checkout" folder. So, it doesn't hide source code as any framework should ideally do.