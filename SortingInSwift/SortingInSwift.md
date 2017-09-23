# Sorting in Swift

### Example 1:

```
var words = [ "one", "two", "three", "dog", "7", "butterfly", "5", "Butterfly", "house"]

words.sort()

print("Sort Ascending: \(words)")

words.sort{ $0 > $1 }

print("Sort Descending: \(words)")

words.sort{ $0.characters.count > $1.characters.count }

print("Sort by length descending: \(words)")
```

### Example 2:

```
var unsortedArray = [100, 50, 30, 2,0, 200]
var secondObject = Int()
var searchElement = Int()
var firstObject = Int()

for i in stride(from: 0, to: unsortedArray.count, by: 1) {
	searchElement = unsortedArray[i]
	for j in stride(from: i + 1, to: unsortedArray.count, by: 1) {
	    if searchElement < unsortedArray[j] {
	        
	    } else {
	    	//Swap
	      	firstObject = unsortedArray[i]
        	secondObject = unsortedArray[j]
	       // Remove first object 
	       unsortedArray.remove(at: i)
			// insert Second object at first place
	       unsortedArray.insert(secondObject, at: i)
			// Remove second Object 
	       unsortedArray.remove(at: j)
			// insert first object at second place
	       unsortedArray.insert(firstObject, at: j)
	    }
	}
}
print(unsortedArray)
```