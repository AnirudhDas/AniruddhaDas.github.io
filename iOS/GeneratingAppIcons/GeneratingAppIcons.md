# Generating App Icons with one app icon file

### Steps

1. `copy` and `paste` following script as plain text document.

```	
cp 1024x1024.png AppIcon-20.png
sips -Z 20 AppIcon-20.png

cp 1024x1024.png AppIcon-20@2x.png
sips -Z 40 AppIcon-20@2x.png

cp 1024x1024.png AppIcon-20@3x.png
sips -Z 60 AppIcon-20@3x.png

cp 1024x1024.png AppIcon-29.png
sips -Z 29 AppIcon-29.png

cp 1024x1024.png AppIcon-29@2x.png
sips -Z 58 AppIcon-29@2x.png

cp 1024x1024.png AppIcon-29@3x.png
sips -Z 87 AppIcon-29@3x.png

cp 1024x1024.png AppIcon-40.png
sips -Z 40 AppIcon-40.png

cp 1024x1024.png AppIcon-40@2x.png
sips -Z 80 AppIcon-40@2x.png

cp 1024x1024.png AppIcon-40@3x.png
sips -Z 120 AppIcon-40@3x.png

cp 1024x1024.png AppIcon-60@3x.png
sips -Z 180 AppIcon-60@3x.png

cp 1024x1024.png AppIcon-76.png
sips -Z 76 AppIcon-76.png

cp 1024x1024.png AppIcon-76@2x.png
sips -Z 152 AppIcon-76@2x.png

cp 1024x1024.png AppIcon-83.5@2x.png
sips -Z 167 AppIcon-83.5@2x.png

rm 1024x1024.png

mkdir AppIcon.appiconset

mv AppIcon-20.png AppIcon.appiconset/AppIcon-20.png
mv AppIcon-20@2x.png AppIcon.appiconset/AppIcon-20@2x.png
mv AppIcon-20@3x.png AppIcon.appiconset/AppIcon-20@3x.png
mv AppIcon-29.png AppIcon.appiconset/AppIcon-29.png
mv AppIcon-29@2x.png AppIcon.appiconset/AppIcon-29@2x.png
mv AppIcon-29@3x.png AppIcon.appiconset/AppIcon-29@3x.png
mv AppIcon-40.png AppIcon.appiconset/AppIcon-40.png
mv AppIcon-40@2x.png AppIcon.appiconset/AppIcon-40@2x.png
mv AppIcon-40@3x.png AppIcon.appiconset/AppIcon-40@3x.png
mv AppIcon-60@3x.png AppIcon.appiconset/AppIcon-60@3x.png
mv AppIcon-76.png AppIcon.appiconset/AppIcon-76.png
mv AppIcon-76@2x.png AppIcon.appiconset/AppIcon-76@2x.png
mv AppIcon-83.5@2x.png AppIcon.appiconset/AppIcon-83.5@2x.png

echo '{
  "images" : [
    {
      "idiom" : "iphone",
      "size" : "20x20",
      "filename" : "AppIcon-20@2x.png",
      "scale" : "2x" 
    },
    {
      "idiom" : "iphone",
      "size" : "20x20",
      "filename" : "AppIcon-20@3x.png",
      "scale" : "3x" 
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "AppIcon-29@2x.png",
      "scale" : "2x" 
    },
    {
      "size" : "29x29",
      "idiom" : "iphone",
      "filename" : "AppIcon-29@3x.png",
      "scale" : "3x" 
    },
    {
      "size" : "40x40",
      "idiom" : "iphone",
      "filename" : "AppIcon-40@2x.png",
      "scale" : "2x" 
    },
    {
      "size" : "40x40",
      "idiom" : "iphone",
      "filename" : "AppIcon-40@3x.png",
      "scale" : "3x" 
    },
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "filename" : "AppIcon-40@3x.png",
      "scale" : "2x" 
    },
    {
      "size" : "60x60",
      "idiom" : "iphone",
      "filename" : "AppIcon-60@3x.png",
      "scale" : "3x" 
    },
    {
      "idiom" : "ipad",
      "size" : "20x20",
      "filename" : "AppIcon-20.png",
      "scale" : "1x" 
    },
    {
      "idiom" : "ipad",
      "size" : "20x20",
      "filename" : "AppIcon-20@2x.png",
      "scale" : "2x" 
    },
    {
      "size" : "29x29",
      "idiom" : "ipad",
      "filename" : "AppIcon-29.png",
      "scale" : "1x" 
    },
    {
      "size" : "29x29",
      "idiom" : "ipad",
      "filename" : "AppIcon-29@2x.png",
      "scale" : "2x" 
    },
    {
      "size" : "40x40",
      "idiom" : "ipad",
      "filename" : "AppIcon-40.png",
      "scale" : "1x" 
    },
    {
      "size" : "40x40",
      "idiom" : "ipad",
      "filename" : "AppIcon-40@2x.png",
      "scale" : "2x" 
    },
    {
      "size" : "76x76",
      "idiom" : "ipad",
      "filename" : "AppIcon-76.png",
      "scale" : "1x" 
    },
    {
      "size" : "76x76",
      "idiom" : "ipad",
      "filename" : "AppIcon-76@2x.png",
      "scale" : "2x" 
    },
    {
      "idiom" : "ipad",
      "size" : "83.5x83.5",
      "filename" : "AppIcon-83.5@2x.png",
      "scale" : "2x" 
    }
  ],
  "info" : {
    "version" : 1,
    "author" : "xcode" 
  }
}' > Contents.json

mv Contents.json AppIcon.appiconset/Contents.json
```

2. Save as `GenerateAppIcons.sh`

3. Move above script under `Assets.xcassets` folder.

4. Also place Appicon with highest size and name `1024x1024.png`.

5. Launch `Terminal`.

6. Change your directory (in `terminal`) to `Assets.xcassets` folder.

	Example:
	
	```
	$ cd ~/Desktop/MyProject/MyProject/Assets.xcassets
	```
	
7. Make sure you've added appropriate permission to execute script. Run script using following command.

	```
	$ sh GenerateAppIcons.sh
	```