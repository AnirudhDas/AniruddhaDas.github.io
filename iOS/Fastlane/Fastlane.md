# Fastlane

Fastlane is a powerful suite of tools that helps unify an iOS developer’s build and deployment processes, affording greater automation through sophisticated integrations with various third-party tools.
Fastlane is the tool to release your iOS and Android app. It handles all the tedious tasks, like generating screenshots, dealing with code signing and releasing your application.

### How to install?

To install Fastlane, you first need to make sure you have Ruby installed on your Mac, which you can do by typing in terminal:

```
ruby -v
```

You then install the Fastlane gem using below command:

```
sudo gem install fastlane --verbose
```

Within iOS project, you initialize a new Fastlane project:

```
fastlane init
```

This will create all the files you need, stored within the ```/fastlane``` folder. During the process you will be asked to provide information including your app bundle id and your Apple ID used for logging into iTunes Connect.

------

### Commands provided by Fastlane

##### snapshot

Snapshot, as its name suggests, automates the process of taking screenshots in multiple languages and devices (simulators), running completely in the backround.

To use Snapshot, you start by installing the ```gem```, in terminal, as follows:

```
sudo gem install snapshot
```

To initialize snapshot in your project, by calling:

```
snapshot init
```

This will create subfolders in your project, To take screenshot of project, simply call:

```
snapshot
```

------

##### gym

Gym is the true workhorse utility in the suite, used for building, packaging and signing ```.ipa``` files.

To use gym, you start by installing the ```gem```, in terminal, as follows:

```
sudo gem install gym
```

And run it using:

```
gym
```

You will be prompted to specify the workspace and scheme during the process, as follows:

```
gym --workspace "Example.xcworkspace" --scheme "AppName" --clean
```

------

##### scan

Scan makes it easy to run test cases of your iOS and Mac app on a simulator or connected device.

For a list of all available parameters, use:

```
scan --help
```

To use scan, you start by installing the ```gem```, in terminal, as follows:

```
sudo gem install scan
```

Make sure, you have the latest version of the Xcode command line tools installed.

And run using:

```
scan
```

------

##### frameit

FrameIt allows you to put a gorgeous device frame around your iOS screenshots just by running one simple command. Use frameit to prepare perfect screenshots for the App Store, your website, QA or Emails.

To use frameit, you start by installing the ```gem```, in terminal, as follows:

```
sudo gem install frameit
```

Because of legal reasons, I cannot pre-package the device frames with frameit.

The process of adding is really easy. Just run ```frameit``` and the guide will help you set it up. You only have to do this once per computer.

* Run ```frameit```.
* Press Enter. The Apple page to download the images should open in your browser.
* Download the devices you want to use.
* Press Enter.
* Unzip and move the content of the zip files to ```~/.frameit/devices_frames```.
* Press Enter.

To use it, just navigate to your folder of screenshots and use the following command:

```
frameit
```

To use the silver version of the frames:

```
frameit silver
```

To run the setup process again to add new frames use:

```
frameit setup
```

------

##### beta

Use Fabric to integrate Fastlane into your project, to send out builds.

**Within the ```Fastfile```, include the following code:**

```
fastlane_version "1.106.2"

default_platform :ios

platform :ios do

  lane :beta do |values|
    # ensure_git_status_clean
    # increment_build_number(xcodeproj: “MyProjectName.xcodeproj")
    # commit_version_bump(xcodeproj: "MyProjectName.xcodeproj")
    gym(scheme: 'MyProjectName', export_method: 'ad-hoc')

    emails = values[:test_email] ? values[:test_email] : [‘adas@gmail.com', ‘taisung57@gmail.com', ‘cse.anirudh@gmail.com']
    groups = values[:test_email] ? nil : nil

    crashlytics(api_token: '<crashlytics_api_token>',
             build_secret: '<crashlytics_build_secret>',
                   emails: emails,
                   groups: groups,
                    notes: 'Distributed with fastlane', # Check out the changelog_from_git_commits action
            notifications: true) # Should this distribution notify your testers via email?

    # for all available options run `fastlane action crashlytics`
  end
end

```

**To send the build:**

1. Use terminal to go inside your project directory
2. Use the below command

```
fastlane beta
```