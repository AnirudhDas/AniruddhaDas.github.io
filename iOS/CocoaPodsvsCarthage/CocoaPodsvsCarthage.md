# CocoaPods VS Carthage

Both are dependency managers, and both expose the source code of the component.

However there are two important differences bwtween them:

1. With CocoaPods, your component is publicly discoverable by any developer in the world. So anyone can install the pod to checkout your component into their project.

	But with Carthage, someone can only check out your component, if they have a reference to your code repository. It is not publicly discoverable.

2. Whenenver you install a pod, it creates a seperate .xcworkspace, which changes some of your project settings. Also it adds the source code files into your project. You can make changes to these source files.

	Whereas, with carthage, when you check out a component, it checks out the source code along with a compiled framework, in a seperate directory, not within your project. It doesn't make any change to your project setings. You need to drag and drop this framework into your project to use it.