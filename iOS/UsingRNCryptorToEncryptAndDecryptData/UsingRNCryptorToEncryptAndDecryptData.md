# Using `RNCryptor` to encrypt and decrypt data in your App

The RNCryptor library is a good choice for encrypting and decrypting data.

The library's main features are listed below:

- AES-256 Encryption
- CBC Mode
- Password Stretching with PBKDF2
- Password Salting
- Random IV
- Encrypt-Then-Hash HMAC

### Example

We will be seeing a simple example on how to work with `RNCryptor`.

### Step 1

Create a project `RNCryptorDemo`

### Step 2

Use pod `RNCryptor` in Podfile. And use command `pod install`.

### Step 3

In `ViewController.swift`, write:

```
import UIKit
import RNCryptor

class ViewController: UIViewController {

	override func viewDidLoad() {
		super.viewDidLoad()
        
        let secretKey = "secret@123#"
        
        // Encryption
        let plainTextString = "Anirudh"
        let plainTextData = plainTextString.data(using: String.Encoding.utf8)
        let encryptedData = RNCryptor.encrypt(data: plainTextData!, withPassword: secretKey)
        print("encryptedData is \(encryptedData)")
		
        
		// Decryption
        do {
            let plainTextData1 = try RNCryptor.decrypt(data: encryptedData, withPassword: secretKey)
            let plainTextString1 = String(data: plainTextData1, encoding: String.Encoding.utf8)
            print("plainTextString is \(plainTextString1!)")
        } catch {
            print(error)
        }
			

	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}
```

### Output

```
encryptedData is 82 bytes
plainTextString is Anirudh
```