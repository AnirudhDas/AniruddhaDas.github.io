# Swift Package Manager (SPM)

### Yet another Dependency Manager

The Swift Package Manager is a tool for managing the distribution of Swift code. It’s integrated with the Swift build system to automate the process of downloading, compiling, and linking dependencies.

That’s right, Swift now has an **official package manager** from Apple! The Package Manager is included in Swift 3.0 and above.

The Swift Package Manager is a tool for managing distribution of source code, aimed at making it easy to share your code and reuse others’ code. The tool directly addresses the challenges of compiling and linking Swift packages, managing dependencies, versioning, and supporting flexible distribution and collaboration models.

The system is designed to make it easy to share packages on services like GitHub, but packages are also great for private personal development, sharing code within a team, or at any other granularity.

----

### Features

1. **Conflict Resolution**
2. **Dependency Fetching**
3. **Workspace Integration**
4. **Source Code Compilation**
5. **Written only in Swift (Objective C is not supported)**
6. **Shipped with Swift 3.0**
7. **Linux and MacOS Compatible only (Not with iOS, tvOS and watchOS)**
8. **Doesn't handle Assets (Storyboards or Xibs)**
9. **Has ```no lockfile``` like in CocoaPods, or no ```resolved``` file like in Carthage**

### Installation

The Swift Package Manager comes by default, included in Xcode 8.0 and all subsequent release.

So, you need not use **```home brew```** or **```ruby gem```**.

----

### Using a Package/Module

#### **1. Declare**

You will need to create a ```Package.Swift``` file at the ```project's root folder```. It describes your app to SPM. Inside it, put the following code (change the url to your git repo):

```
import PackageDescription

let package = Package(
    name: "<YourAppName>",
    dependencies: [
        .Package(url: "https://github.com/<DependencyName1>.git", majorVersion: 1.0.12),
        .Package(url: "https://github.com/<DependencyName2>.git", majorVersion: 1.0.8)
    ]
)
```

#### **2. Fetch**

Run **`swift package fetch`** in terminal.

It will add your dependencies into ```Packages``` folder.

#### **3. Build your project**

You can use ```swift build``` command on terminal to build your dependencies as frameworks and also your project.

Or alternatively, you can use ```swift package generate-xcodeproj``` to generate an XCode project.

**Note:** You can't configure the generated xcodeproj.

----

### Creating a Package/Module

Create a ```Package.Swift``` file at the root folder of your module. It should contain the following code (change the package name):

```
import PackageDescription
let package = Package(
  name: "<YourPackageName>",
  dependencies: [
        .Package(url: "https://github.com/<DependencyName1>.git"),
        .Package(url: "https://github.com/<DependencyName1>.git")
    ]
)
```

You will need to make sure your ```.Swift``` files are in a **`Sources`** folder.

Put a tag to your code and publish.

```
git tag 1.0.13
```

or

```
set tag of https://github.com/<YourPackageName>.git to 1.0.13
```

### Source

To read more, refer:

1. [Speech on Swift Package Manager by JEAN CHRISTOPHE](https://www.youtube.com/watch?v=FzgEt2e0Y1w&t=1s)

2. [https://swift.org/package-manager/#conceptual-overview](https://swift.org/package-manager/#conceptual-overview)

3. [https://github.com/apple/swift-package-manager](https://github.com/apple/swift-package-manager)

4. [https://medium.com/swift-and-ios-writing/swift-package-manager-tutorial-59ade1fc708d#.q9qijdh4t](https://medium.com/swift-and-ios-writing/swift-package-manager-tutorial-59ade1fc708d#.q9qijdh4t)