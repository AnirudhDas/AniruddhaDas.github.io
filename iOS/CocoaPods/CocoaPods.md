# iOS Using Cocoa Pods

### Installing CocoaPods

If cocoapod is not already available, install it using following command.

```
$ sudo gem install cocoapods
```

### Updating (Installing latest) CocoaPods

1. Update gems

```
sudo gem update --system
```

2. Install cocoapods

```
sudo gem install cocoapods
```

3. Setup cocoapods

```
pod setup
```

### Using CocoaPods

1. Open project

	Navigate to `YourXCodeProject.xcodeproj`

2. Create Podfile

	Create file called `Podfile` (no extension & exact name)

3. Add pods

	Enter the text contents as follows in that file.

	```
# Under target name, you should give your project's target name.
target "YourXCodeProject" do
# Add the dependencies here.
    pod 'Cosmos'
    pod 'EasyToast'
    pod 'Fabric'
    pod 'Crashlytics'
end
	```

4. Install pods

	Switch to `Terminal` and run following command for installing pods.

	```
pod install
	```

5. Update pods

	Switch to `Terminal` and run following command for updating pods.

	```
	pod update
	```