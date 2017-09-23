# What is Localization Table?

If you want to use the same key in two different classes / files (say for example, View Controller and App Delegate). With localization, it gives an error, as the same key has already been used before.

To avoid this, we can have `localization tables` for keeping separate module wise localization keys, instead of keeping all localization keys in one single file `Localization.strings`.

With Localization tables, we can have multiple `.strings` file with the same keys in them. When we try to use them in code, we need to mention which `.strings` file it should take the key from.