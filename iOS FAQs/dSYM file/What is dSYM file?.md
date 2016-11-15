# What is dSYM file?

```.dSYM``` files store the debug symbols for your app.

Instead of giving us the crash report in binary format, it tells us the error report in human readable format. So, we can know the exact file and the method where the error has originated from.

Services like ```Crashlytics``` uses it to replace the symbols in the crash logs with the appropriate methods names, so that it will be readable by us and will make sense.

The benefit of using the dSYM file is that you don't need to ship your App with it's symbols, making it harder to reverse engineer it and also reduces your binary size.

In order to symbolicate the crash log, you need to drag the crash log into the device logs in the organizer of the machine that compiled the app binary (a machine that stores the dSYM).