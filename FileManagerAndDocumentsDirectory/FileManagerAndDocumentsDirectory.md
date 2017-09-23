# FileManager And Documents Directory

### How to read file data Applications document directory in swift?

```
var paths = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
var getImagePath = paths.stringByAppendingPathComponent("filename")
myImageView.image = UIImage(contentsOfFile: getImagePath)
```

### Getting list of files in documents folder

```
// Get the document directory url
let documentsUrl =  FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!

do {
    // Get the directory contents urls (including subfolders urls)
    let directoryContents = try FileManager.default.contentsOfDirectory(at: documentsUrl, includingPropertiesForKeys: nil, options: [])
    print(directoryContents)

    // if you want to filter the directory contents you can do like this:
    let mp3Files = directoryContents.filter{ $0.pathExtension == "mp3" }
    print("mp3 urls:",mp3Files)
    let mp3FileNames = mp3Files.map{ $0.deletingPathExtension().lastPathComponent }
    print("mp3 list:", mp3FileNames)

} catch let error as NSError {
    print(error.localizedDescription)
}
```

### Delete files from directory inside Document directory

```
func clearAllFilesFromTempDirectory(){

    var error: NSErrorPointer = nil
    let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
    var tempDirPath = dirPath.stringByAppendingPathComponent("Temp")
    var directoryContents: NSArray = fileManager.contentsOfDirectoryAtPath(tempDirPath, error: error)?

    if directoryContents != nil {
        for path in directoryContents {
            let fullPath = dirPath.stringByAppendingPathComponent(path as! String)
            if fileManager.removeItemAtPath(fullPath, error: error) == false {
                println("Could not delete file: \(error)")
            }
        }
    } else {
        println("Could not retrieve directory: \(error)")
    }
}
```

### How to check if a file exists in the Documents directory in Swift?

```
let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
let url = NSURL(fileURLWithPath: path)
let filePath = url.appendingPathComponent("nameOfFileHere")?.path
let fileManager = FileManager.default
if fileManager.fileExists(atPath: filePath!) {
    print("FILE AVAILABLE")
} else {
    print("FILE NOT AVAILABLE")
}
```

### How to secure a file stored in Documents directory?

Get the file from it's path. Get the contents out and encrypt it.

### How to move file from Bundle to Documents or Library directory?

```
let bundlePath = NSBundle.mainBundle().pathForResource("information", ofType: ".png")
print(bundlePath, "\n") //prints the correct path
let destPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true).first!
let fileManager = NSFileManager.defaultManager()
let fullDestPath = NSURL(fileURLWithPath: destPath).URLByAppendingPathComponent("information.png")
let fullDestPathString = fullDestPath.path
print(fileManager.fileExistsAtPath(bundlePath!)) // prints true

do{
try fileManager.copyItemAtPath(bundlePath!, toPath: fullDestPathString)
}catch{
    print("\n")
    print(error)
}
```

```
let bundlePath = NSBundle.mainBundle().pathForResource("information", ofType: ".png")
print(bundlePath, "\n") //prints the correct path
let destPath = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask)[0]
let fileManager = NSFileManager.defaultManager()
let fullDestPath = NSURL(fileURLWithPath: destPath).URLByAppendingPathComponent("information.png")
let fullDestPathString = fullDestPath.path
print(fileManager.fileExistsAtPath(bundlePath!)) // prints true

do{
try fileManager.copyItemAtPath(bundlePath!, toPath: fullDestPathString)
}catch{
    print("\n")
    print(error)
}
```