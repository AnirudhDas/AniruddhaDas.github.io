# How to transfer data from one app to another app?

1. Keychain Sharing - We can store the data into the KeyChain Access, so that different apps can use the same keychain access, and exchange data with each other.

	We need to enable KeyChain Sharing in the provisioning profile and create a group id from developer portal.

	When we enable and create the same group id in Xcode, it creates an entitlement file.

2. Share Extension - We can create an unique app group identifier, for different apps. We need to enable ```App Groups``` option from ```Capablities``` section in project settings. It creates an entitlement file.

	Share Extensions work in a Host App and Container App manner. It opens up a `ActivityViewController` with a choice of Container Apps.

	We can even show data as widgets on today's screen. For that we need to add another target for ```today's extension```. Within this new target, add the same app group as the host app.

3. Url Scheme - We can open one application from another application to share data.

### Refer

[https://www.appcoda.com/ios8-share-extension-swift/](https://www.appcoda.com/ios8-share-extension-swift/)