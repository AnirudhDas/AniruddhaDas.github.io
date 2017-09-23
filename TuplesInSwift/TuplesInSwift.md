# Tuples in Swift

- Tuples group multiple values into a single compound value.
- The values within a tuple can be of any type and do not have to be of the same type as each other.
- A good use can be a function which returns multiple values.


**Example**

- An HTTP Error with code & message `(404, "Not Found")`

```
let http404Error = (404, "Not Found")
```

Here `http404Error` is of type `(Int, String)` and equals `(404, "Not Found")`

**Decomposing a tuple's contents**

```
let (statusCode, statusMessage) = http404Error
print("Status code is \(statusCode)")
// prints "Status code is 404" 

print("The status message is \(statusMessage)")
// prints "The status message is Not Found" 
```

**Decomposing specific content from tuple**

When a specific tuple's value is not needed, use `_`

```
let (justStatusCode, _) = http404Error
print("The status code is \(justStatusCode)")
// prints "The status code is 404" 
```

**Accessing `Tuple` with index**

```
print("The status code is \(http404Error.0)")
// prints "Status code is 404" 
print("The status message is \(http404Error.1)")
// prints "The status message is Not Found"
```

**Naming individual elements**

```
let http200Status = (statusCode: 200, description: "Ok")
print("The status code is \(http200Status.statusCode)")
// prints - The status code is 200
print("The status message is \(http200Status.description)")
// prints - The status message is Ok
```

**Output**

```
Status code is 404
The status message is Not Found
The status code is 404
The status code is 404
The status message is Not Found
The status code is 200
The status message is Ok
```