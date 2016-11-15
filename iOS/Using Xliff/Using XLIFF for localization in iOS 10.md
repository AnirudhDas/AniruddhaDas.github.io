# Using XLIFF for localization in iOS 10

# Introduction

I have already covered localization earlier. Refer [Localization in iOS 10 and Xcode 8](https://github.com/AnirudhDas/AniruddhaDas.github.io/blob/master/iOS/Localization/Localization.md).

# Problems with the above method

1. The above method is a bit tedious as you have to manually write all the keys and corresponding values for all supportive languages. 

	For example, for the key "Header", you maually entered the value as "Hello" in English, and "नमस्ते" in Hindi.

2. Let's say you have a login-view.

```
class LoginViewController: UIViewController {

    @IBOutlet weak var descriptionTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionTextLabel.text = NSLocalizedString("text-value-set-in-viewcontroller", comment: > "A short line of text between the title and the textfields.")
    }
}
```

When you run the app, you see:

![](https://github.com/AnirudhDas/AniruddhaDas.github.io/blob/master/iOS/Using%20Xliff/3.png)

And you have already generated ```Main.strings (Dutch)``` file.

![](https://github.com/AnirudhDas/AniruddhaDas.github.io/blob/master/iOS/Using%20Xliff/2.png)

![](https://github.com/AnirudhDas/AniruddhaDas.github.io/blob/master/iOS/Using%20Xliff/4.png)

The contents of ```Main.strings (Dutch)``` looks like the following:

```
/* Class = "UIButton"; normalTitle = "login-button"; ObjectID = "JxI-gF-4bE"; */
"JxI-gF-4bE.normalTitle" = "login-button";

/* Class = "UITextField"; placeholder = "password-textfield"; ObjectID = "Omb-XY-h8s"; */
"Omb-XY-h8s.placeholder" = "password-textfield";

/* Class = "UILabel"; text = "description-text"; ObjectID = "SfU-pu-eHV"; */
"SfU-pu-eHV.text" = "description-text";

/* Class = "UITextField"; placeholder = "username-textfield"; ObjectID = "T8a-hm-lDV"; */
"T8a-hm-lDV.placeholder" = "username-textfield";

/* Class = "UILabel"; text = "view-title"; ObjectID = "a1b-1B-MkE"; */
"a1b-1B-MkE.text" = "view-title";
```

Now, when I’ll add a new "forgot-password" button and I want to translate the value of the newly created button in the ```Main.strings (Dutch)```, the "forgot-password" button is not to be found in the list of strings. It seems that Xcode does not automatically update ```Main.strings (Dutch)```. You could of course delete your language in your Project Settings and add it again, but that would also delete every translation you already did. The same goes for the file that genstrings generated for you.

# Solution

To get around this problem, we can export an ".xliff" file and translate all the corresponding values into multiple languages all at once, using some third party tool. We can then import all those ".xliff" files for multiple languages into our project.

![](https://github.com/AnirudhDas/AniruddhaDas.github.io/blob/master/iOS/Using%20Xliff/1.png)

XLIFF is an XML-based format created to standardize the way localizable data are passed between tools during a localization process (source wikipedia). Since Xcode 6 it is possible to use XLIFF-format for localization.

Let’s go back a couple of steps, to the point where we initially selected our project in the Project Navigator and try again, but now we will be using XLIFF.

### Step 1

Go to ``` Project Navigator -> Editor -> Export For Localization ```

![](https://github.com/AnirudhDas/AniruddhaDas.github.io/blob/master/iOS/Using%20Xliff/5.png)

### Step 2

We can now edit XLIFF-files in a text editor.

You could choose to open and edit the file in your favorite text-editor to do the translations. You will find that the XLIFF-file is a collection of all the localized strings of your project. These strings are ordered by file. The different files are recognizable by the following tag:

```
<file original="Localization/Base.lproj/Main.storyboard" source-language="en" datatype="plaintext">
```
In these files, the strings are called trans-units. The trans-units will typically have a source (which is the key) and a note (which is the comment) and look like this:

```
<trans-unit id="T8a-hm-lDV.placeholder">
    <source>username-textfield</source>
    <note>Class = "UITextField"; placeholder = "username-textfield"; ObjectID = "T8a-hm-lDV";</note>
</trans-unit>
```

When adding a translation in the text-editor you have to keep in mind that XLIFF works with a structure of source and target. This happens on multiple levels. First you’ll have to add a target-language to the file header:

```
<file original="Localization/Base.lproj/Main.storyboard" source-language="en" target-language="nl" datatype="plaintext">
```

Now you can add translations of individual strings:

```
<trans-unit id="T8a-hm-lDV.placeholder">
    <source>username-textfield</source>
    <target>Gebruikersnaam</target>
    <note>Class = "UITextField"; placeholder = "username-textfield"; ObjectID = "T8a-hm-lDV";</note>
</trans-unit>
```

Instead of adding translations manually, we can also automaatically generate these translations for multiple languages by using third party tools. Refer [How to translate iOS XLIFF files](https://poeditor.com/help/how_to_translate_ios_xliff) and [Localize Your Xcode Application With XLIFF](https://phraseapp.com/blog/posts/ios-how-to-translate-apps-in-xcode/).

### Step 3

After the translations are done, you are ready to import your translations into your Xcode-project. But before I add the translations I’ll add the ‘forgot-password’-button again, because it could very well happen that you will continue on your project and make some changes when the translator is busy translating. I add the translations by again selecting your project in the Project Navigator and in the taskbar go to ``` Editor -> Import Localizations```. When I do this I receive a couple of warnings. This is because the XLIFF-file I am importing does not contain a translation for every string in my project, one of which is the ‘forgot-password’-button I added after I exported the strings for translation.

![](https://github.com/AnirudhDas/AniruddhaDas.github.io/blob/master/iOS/Using%20Xliff/6.png)

Don’t worry! This is not a problem! For now we’ll just accept the missing translations and import what we have received from the translator. If we now browse the Project Navigator and look up ```Main.strings (Dutch)```. We’ll see all the translated strings, but not the strings that do not have translation, so we can not add those missing translations in Xcode. Luckily we do not want that anyway, we want to export strings and send them to the translator.

If we export the strings for the second time the Save Dialog Box is slighty changed. It now allows us to export the existing translations as well. This way the translator will not have to translate strings he already translated, but can just translate the strings that missed a translation.