# Storing data into Keychain of Device

### Introduction

For sensitive information, such as credentials, the keychain is your best option. This is only feasible for small amounts of data your application doesn't need frequent access to.

Also, using Keychain, we can share data between two different apps. For this, use pod `KeychainSwift`.

### Example

In this example, we will make use of a simple wrapper known as `SwiftKeychainWrapper`.

### Step 1

Create a project `KeychainDemo`.

### Step 2

Add a `Podfile` to the project.

```
target "KeychainDemo" do
  use_frameworks!
  pod 'SwiftKeychainWrapper'
end
```

Use command `pod install`.

### Step 3

Inside your `ViewController.swift`, write:

```
import UIKit
import SwiftKeychainWrapper

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let saveSuccessful: Bool = KeychainWrapper.standard.set("Confidential Data", forKey: "myKey")
        
        let retrievedString: String? = KeychainWrapper.standard.string(forKey: "myKey")
        print(retrievedString!)
        
        let removeSuccessful: Bool = KeychainWrapper.standard.remove(key: "myKey")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
```

### Output

```
Confidential Data
```