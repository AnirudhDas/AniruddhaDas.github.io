# Base64 Data To String Conversion and vice versa

```
let str = "base64 String here"
let strData = str.dataUsingEncoding(NSUTF8StringEncoding)
let base64EncodedString = strData?.base64EncodedDataWithOptions(NSDataBase64EncodingOptions(rawValue : 0))
print(base64EncodedString!)
```

```
let decodedData = NSData(base64EncodedData: base64EncodedString!, options:NSDataBase64DecodingOptions(rawValue: 0))
let decodedStr = NSString(data: decodedData!, encoding: NSUTF8StringEncoding)
print(decodedStr!)
```

### Output

```
596d467a 5a545930 49484e30 636d6c75 5a79426f 5a584a6c
```

```
base64 string here
```