# Prevent files from being backed up to iCloud

### Method 1

```
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //If file is inside Bundle
        
        let audioFileName = "audioName"
        
        if let audioFilePath = Bundle.main.path(forResource: audioFileName, ofType: "mp3", inDirectory: "audioFiles") {
            print(audioFilePath)
            print(self.addSkipBackupAttributeToItemAtURL(filePath: audioFilePath))
        }
        
        // If File is inside Documents Directory
        
        let file = "myFile.zip"
        if let dir : NSString = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.allDomainsMask, true).first as NSString? {
            //path will be stored here
            let sPath = dir.appendingPathComponent(file);
            
            print(sPath) //  printing the file path
            
            print(self.addSkipBackupAttributeToItemAtURL(filePath: sPath))
            
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func addSkipBackupAttributeToItemAtURL(filePath:String) -> Bool
    {
        let URL:NSURL = NSURL.fileURL(withPath: filePath) as NSURL
        
        assert(FileManager.default.fileExists(atPath: filePath), "File \(filePath) does not exist")
        
        var success: Bool
        do {
            try URL.setResourceValue(true, forKey:URLResourceKey.isExcludedFromBackupKey)
            success = true
        } catch let error as NSError {
            success = false
            print("Error excluding \(URL.lastPathComponent) from backup \(error)");
        }
        
        return success
    }
}
```

### Method 2

```
import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //If file is inside Bundle
        
        let audioFileName = "audioName"
        
        if let audioFileURL = Bundle.main.url(forResource: audioFileName, withExtension: "mp3", subdirectory: "audioFiles") {
            print(audioFileURL)
            
            do {
                let url = audioFileURL // the URL of the file
                try FileManager.default.addSkipBackupAttributeToItemAtURL(url: url as NSURL)
            } catch {
                // Handle error here
                print("Error: \(error)")
            }
        } 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    } 
}

extension FileManager{
    func addSkipBackupAttributeToItemAtURL(url:NSURL) throws {
        try url.setResourceValue(true, forKey: URLResourceKey.isExcludedFromBackupKey)
    }
}
```