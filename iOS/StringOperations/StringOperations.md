# String Operations in Swift


### Reverse a string

```
var simStr = "hello"
var rev = ""

for ch in simStr.characters {
    print(ch)
    rev = String(ch) + rev
}

print(rev)
```

OR

```
var simpleStr = "hi shridhar mali"
var newStr = simpleStr.characters.reversed()
print(newStr)
```

### Check if a string is Palindrome

```
var palimdromStr = "auttua"
var reverse = ""

for ch in palimdromStr.characters {
    reverse = String(ch) + reverse
}
print(reverse)

if palimdromStr == reverse {
    print("String is palimdrom")
} else {
    print("Not")
}
```

## String replacement

```
var aString = "Replace the letter e with *"
var replacedString: String! = aString.replacingOccurrences(of: "e", with: "*")

print(replacedString)
```

### Replace substring with Range

```
var aStr = "ABCDEF"
var aRange = aStr.range(of: "C")
aStr.replaceSubrange(aRange!, with: "F")
print(aStr)
```