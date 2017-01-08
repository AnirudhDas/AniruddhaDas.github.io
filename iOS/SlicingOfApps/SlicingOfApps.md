# What is slicing/thinning and how we can achieve in app?

### App Slicing/App Thinning
In application bundle, if we use the Asset.catalog with 1x, 2x, 3x images. App slicing is a technique which recognize the device which demands the binary, and it will provide the images which compatible to only that device instead of all (1x, 2x, 3x images). So, it reduces the actual size of the binary.

### BitCode
BitCode is a technique which optimizes the binary as per the device architectures (32-bit or 64-bit). So it will send the binary only for that architecture. We have to set the compiler flag for BitCode in the Build Setting of the app.

### Resource on Demand
Resource on demand is a technique which will download the resource, only related to the specific steps of functionality.

Example: A game having 3 steps, first step is free once you download the app and other two steps are not yet unlocked. Once user unlocks the 2nd step, only then the content related of 2nd step will be downloaded.