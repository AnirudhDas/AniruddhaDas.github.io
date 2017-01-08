# Provisioning Profile in iOS Development

A provisioning profile is a collection of digital entities that uniquely ties developers and devices to an authorized iPhone Development Team and enables a device to be used for testing. A Development Provisioning Profile must be installed on each device on which you wish to run your application code. Each Development Provisioning Profile will contain a set of iPhone Development Certificates, Unique Device Identifiers and an App ID. Devices specified within the provisioning profile can be used for testing only by those individuals whose iPhone Development Certificates are included in the profile. A single device can contain multiple provisioning profiles.

The short answer is that this likely means that you participated in a beta test for an iOS application at some point, or otherwise received an iOS app directly from a developer rather than downloading it from the App Store.

Provisioning Profiles are used by iOS Developers to effectively create an association between your device and that developer's account by providing the necessary code-signing certificates to allow you to run their apps. They are often installed automatically through services such as TestFlight or Hockey, but can also be sent out manually as part of an "ad hoc" application package. The profile is normally installed with the app.

### Refer

[http://assoc.tumblr.com/post/63104500264/why-do-ios-provisioning-profiles-exist](http://assoc.tumblr.com/post/63104500264/why-do-ios-provisioning-profiles-exist)