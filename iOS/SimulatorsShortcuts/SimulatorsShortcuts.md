# Generate iOS Simulators Shortcuts/Alias

**Step 1.**

`Copy` & `Paste` following shell script in a plain text file.

```
cd ~/Desktop
mkdir Simulators_Shortcuts
destination="`pwd`/Simulators_Shortcuts" 
cd $destination
cd ~/Library/Developer/CoreSimulator/Devices/
for d in *; do
    if [ -d $d ] ; then
        cd $d;
        deviceName=`/usr/libexec/PlistBuddy -c "print :deviceType" device.plist | sed -e 's/com.apple.CoreSimulator.SimDeviceType.//g'`
        osName=`/usr/libexec/PlistBuddy -c "print :runtime" device.plist | sed -e 's/com.apple.CoreSimulator.SimRuntime.//g'`
        linkName="$deviceName-$osName" 
        currentPath=`pwd`
        ln -s $currentPath "$destination/$linkName" 
        cd ..
    fi
done

cd $destination
```

**Step 2.**

Save the above file as `GenerateSimShortcuts.sh` on `Desktop`.

**Step 3.**

Start `Terminal` & move to `Desktop` by running command `cd ~/Desktop`.

**Step 4.**

To run script `GenerateSimShortcuts.sh`, use following command:

```
sh GenerateSimShortcuts.sh
```

**CAUTION:** Make sure you don't have `duplicate` simulators. If you have multiple/duplicates, above script may create `ISSUES`.

**OUTPUT:** You should find the output folder with simulator aliases under `Simulators_Shortcuts` folder on `Desktop`.