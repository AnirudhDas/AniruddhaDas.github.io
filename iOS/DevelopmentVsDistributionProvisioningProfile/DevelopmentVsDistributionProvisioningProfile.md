# Difference between a development and distribution provisioning profile

You use developer certificate for when you want to install the applications using XCode - mostly when developing.

Distribution certificates are required when you want to put an app on the App Store or when you want to send an AdHoc build to testers (which they can install themselves without using Xcode).

----

Just to explain a bit more, the development provisioning profile is for testing your App on a device (iPad, iPhone, iPod Touch), and the distribution profile is used when you're submitting your application to Apple to get it onto the store.

Both profiles are linked to your account as well as keychains on your computer.

If you'd like to install your software on several devices without using the App Store, you'll have to create an Ad Hoc distribution profile with the device ID numbers, and install that profile as well as the software, on all of the devices.

----

A development profile is used for testing your app when in the development stage.

Distribution profiles are of two types:

- For adhoc testing
- For submission to the App store

Adhoc testing is when you have completed development and want to distribute your app to multiple users for testing (your second question). Just create a distribution profile for adhoc testing and select all the device ids for which the profile is valid. In that case you will only need to send the .app file and .mobileprovision file to each user testing your app.

For submission of the app to app store, you will have to create a distribution mobileprovision file with the "App Store" option selected.

----

### How to create a provisioning certificate?

To create a certificate, we need to create `.CSR` file from `KeyChain Access`. We need to upload that .CSR file in `Certificates` section in developers account, to create `DEVELOPMENT` or `PRODUCTION` certificates.

We then download that provisioning profile and add into our keychain by double clicking that.

Alternatively, XCode also gives us the option of **Automatic Manage Signing**. If we check this option, then Xcode creates an app id and creates provisioning profiles on our behalf.

----

In general:

**Development profile** allows you to test your apps on your physical devices

**App Store Distribution profile** allows you to sign your apps for App Store distribution

**Ad Hoc Distribution profile** allows you to sign your apps for Ad Hoc distribution

If you want to test your app with debugger and everything what Xcode provides, you have to use the development profile.

It is possible to install apps for testing purposes using distribution profiles, but you can't take advantage of the Xcode testing tools.

Summary:

Use development profile for testing and debugging your app
Use distribution profile for signing and distribution of your finished and ready-to-use app.