# Share Extensions

Share extensions, introduced in iOS 8, give users an easy and convenient way to share content with other entities, such as social sharing websites or upload services. Previously, sharing content usually entailed switching from one app to another, for example, while surfing in Safari, if you wanted to share a URL, you would copy it, switch to the app you wanted to save or share it in, perform the action and then resume surfing in Safari. With share extensions, users will now be able to share content to your service direct from within the app they are using, be it Safari, Photos or other apps. This isn’t limited to system applications. Any custom application that presents an instance of the UIActivityViewController class will be able to see your sharing extension if you built your extension so that it can handle the file type provided by that application.

For example, when you select an image, and then select the share icon, you have a choice of applications to share the image to. The usual suspects are Facebook, Twitter, Message and so on. Our goal is to make our application available here.
So I said that this is really a mini app that we can associate with our main app.

That means the life cycle of the share app is a bit different for our main app. A share extension is started by the user selecting the icon for our app.
iOS will launch the share app. This has to happen very quickly, or iOS will shut us down. We don’t want to do anything time-consuming here.
If the user selects and posts an item, our code will run. The item can really be anything shareable. It can be a URL, image, text, or all of the above.
Once selected and processed, the app is shut down.