# Generating 1x, 2x, 3x for Assets

### Steps

- `copy` and `paste` following script as plain text document.

```
for f in *.png
do	
	# Process to get File Name & 2x, 3x file names
	xNAME=`echo "$f" | cut -d'.' -f1`
	cp "$f" "$xNAME@3x.png"
	cp "$f" "$xNAME@2x.png"

	# Set proper resolution to original file
	sips -s dpiHeight 72.0 -s dpiWidth 72.0 "$f"
	
	# Get Width of original file
	xWIDTH=`sips -g pixelWidth "$f" | cut -d':' -f 2 | tail -1 | cut -d' ' -f 2`
	
	# Get Height of original file
	xHEIGHT=`sips -g pixelHeight "$f" | cut -d':' -f 2 | tail -1 | cut -d' ' -f 2`
	
	# Variables for 1x
	xWIDTH1=`expr $xWIDTH / 3`
	xHEIGHT1=`expr $xHEIGHT / 3`
	
	# Variables for 2x
	xWIDTH2=`expr $xWIDTH1 \* 2`
	xHEIGHT2=`expr $xHEIGHT1 \* 2`
	
	# Applying size to all three images
	sips -z "$xHEIGHT1" "$xWIDTH1" "$f"
	sips -z "$xHEIGHT2" "$xWIDTH2" "$xNAME@2x.png"
	
	# Creating Asset folder & moving images into asset folder
	mkdir "$xNAME.imageset"
	mv "$f" "$xNAME.imageset/"
	mv "$xNAME@2x.png" "$xNAME.imageset/"
	mv "$xNAME@3x.png" "$xNAME.imageset/"
	
	echo "{ \"images\" : [ { \"idiom\" : \"universal\", \"filename\" : \"$f\", \"scale\" : \"1x\" }, { \"idiom\" : \"universal\", \"filename\" : \"$xNAME@2x.png\", \"scale\" : \"2x\" }, { \"idiom\" : \"universal\", \"filename\" : \"$xNAME@3x.png\", \"scale\" : \"3x\" } ], \"info\" : { \"version\" : 1, \"author\" : \"xcode\" } }" > Contents.json

	mv Contents.json "$xNAME.imageset/"

done
```

- Save as `script_1x2x3x.sh`

- Move above script under `Assets.xcassets` folder.

- Also place all the assets with highest size in the same folder.

- Launch `Terminal`.

- Change your directory (in `terminal`) to `Assets.xcassets` folder.

	Example:
	
	```
	$ cd ~/Desktop/MyProject/MyProject/Assets.xcassets
	```
	
- Make sure you've added appropriate permission to execute script. Run script using following command.

	```
	$ sh script_1x2x3x.sh
	```