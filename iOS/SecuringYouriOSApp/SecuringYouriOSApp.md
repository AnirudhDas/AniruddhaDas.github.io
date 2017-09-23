# Securing Your iOS App

## Introduction

Security is a key aspect of software development. Almost every mobile application deals with user information or communicates with a remote server.

We will discuss some of the key points that we as developers should have in mind while dealing with App Security.

## Storing Data

#### Should Your Application Store Data

Before you decide how or where to store a particular piece of data, you need to ask yourself whether you should store that data in the first place. Is it possible, for example, to keep the data in memory instead of writing it to disk or sending it to a remote server? This can greatly simplify your application's architecture and improve its security.

#### Where Should You Store Data

If you decide that storing the data locally is your only option, you need to decide where you plan to store that data. For sensitive information, such as credentials, the **keychain** is your best option. This is only feasible for small amounts of data your application doesn't need frequent access to.

**Does the data need to be backed up to iCloud or iTunes?** If that isn't the case, then you may want to consider storing the data in the **Caches** directory of the application's sandbox. **This directory is not backed up to iCloud and iTunes.** Why is that important? Data that doesn't exist cannot be compromised.

#### Keychain

The defaults system, accessible through the `NSUserDefaults` class, is a fast and convenient way to store chunks of data. Unfortunately, the defaults system is often overused by developers. It happens all too often that sensitive information, such as credentials and access tokens, are stored in the defaults system.

A much better location for storing small chunks of sensitive information is the system's **keychain**. As the name implies, it was designed with security in mind and it has been around for many, many years. Even though the keychain is managed by the operating system, by default, **other applications don't have access to the items your application stores in the keychain**.

#### Keys, Tokens, Credentials

It is tempting to store keys, tokens, and even credentials in easily accessible locations, such as the target's **Info.plist** or a JSON file in your application's bundle. The truth is, it is child's play to extract that information from an application downloaded from the App Store. By storing an API token for a web service in your application's Info.plist, other developers can find it and use it.

## Networking

#### App Transport Security

**App Transport Security enforces applications to send network requests over a secure connection. If App Transport Security is enabled for an application, network requests are sent over HTTPS by default.**

#### SSL Certificate Pinning

Using **certificate pinning**, we can ensure the server our application is communicating with, isn't fraudulent. Modern libraries, such as **Alamofire**, make this much easier.

## Sensitive Information

#### User Data

Most applications use or store sensitive user information. Mobile devices have access to a wide range of user information that is often personal and sensitive in nature, such as location, address book, and health information.

As I mentioned earlier in this article, the first question you need to ask yourself is whether you need to access this information and, more importantly, whether you need to store that information.

If you can access the information you need through a native framework, such as HealthKit, then there is no need to duplicate and store that information. For example, **Apple will reject applications that store the user's health information in iCloud**.

#### Keep It Local

Assuming that you need to store some sensitive information, consider whether that information should be kept local. Is it necessary to send sensitive information to a remote server?

Storing sensitive information comes with a warning. If the server you are storing sensitive information on, is compromised, you may be held responsible for exposing that information to other parties.

#### Credentials

Online security has evolved tremendously over the past decades. Authentication protocols, such as OAuth, have made communication with web services more secure and transparent.

If your application needs to talk to a secure server, consider how your application manages credentials. Does it keep them in memory or store them on disk? If you ask the user's username and password to fetch an access token, it is fine to store that access token. But should you also store username and password? The answer is no in most situations.

For applications that deal with very sensitive data, such as health or financial information, it may even be better to keep the access token in memory, not storing it on disk. Keeping it in memory makes it much safer, making your application much less of a liability. Chances are that the access token has a short lifetime anyway.

## Ways to Do it

1. **Using Keychain**

	You can use `Keychain Services` API or `SwiftKeychainWrapper` or `KeychainSwift` pod.

2. **Using Encryption and Decryption**

	You can use `Security framework` or `RNCryptor`.

## Conclusion

The security of an application is a fundamental aspect of software development. Consider what data your application has access to and whether it should store that information. If you do decide to store sensitive information, keep the above tips and best practices in mind. Make sure you treat the user's information with respect. Even though the information may look unimportant to you, it is important to the user.

### Read More:

[https://willowtreeapps.com/ideas/enhanced-device-security-in-ios-9/](https://willowtreeapps.com/ideas/enhanced-device-security-in-ios-9/)