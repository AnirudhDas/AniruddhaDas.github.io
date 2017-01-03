# JSON Parsing from a local JSON file having a JSON array

```
// a string which will hold path of file named `IndiaPost.json`
let str:String? = Bundle.main.path(forResource: "IndiaPost", ofType: "json")

// load file
let data:Data? = Data(contentsOfFile: str!)

// try to parse the data in form of json
do {
    // if json-data parsed
    let jsonData = try JSONSerialization.jsonObject(with: data! as Data, 
                            options: JSONSerialization.ReadingOptions.allowFragments)

    // and if parsed json-data is an array
    if let arrayData:NSArray = jsonData as? NSArray {

            // use your json-array - here I'm setting it to property named `arrayOfLeftMenuItems`
            self.arrayOfLeftMenuItems = arrayData
    }
} catch {
    // handle exception. Here, I'm just logging the error
    print(error)
}
```