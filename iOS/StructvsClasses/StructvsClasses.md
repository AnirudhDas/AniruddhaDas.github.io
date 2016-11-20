# Struct VS Classes

### Class

* ```Class``` is preferred when we want our logic or methods to be inherited or overridden.

* Classes are called ```reference types```.

	Example: Note how when the name is changed, the instance referenced by both variables is updated. Bob is now Sue, everywhere that Bob was ever referenced.

	```
	class SomeClass {
   	 	var name: String
    	init(name: String) {
        	self.name = name
    	}
	}

	var aClass = SomeClass(name: "Bob")
	var bClass = aClass // aClass and bClass now reference the same instance!
	bClass.name = "Sue"

	println(aClass.name) // "Sue"
	println(bClass.name) // "Sue"
	```
	
### Struct

* ```Struct``` is preferred when we dont want our logic or methods to be inherited or overridden.

* Structs are called ```value types```.

	Example: We see that the values are copied and each variable keeps it's own set of values. When we set the name to Sue, the Bob struct in aStruct does not get changed.

	```
	struct SomeStruct {
    	var name: String
    	init(name: String) {
        	self.name = name
    	}
	}

	var aStruct = SomeStruct(name: "Bob")
	var bStruct = aStruct // aStruct and bStruct are two structs with the same value!
	bStruct.name = "Sue"

	println(aStruct.name) // "Bob"
	println(bStruct.name) // "Sue"
	```

* Same is true for ```Enums``` as well. This is why enums are also called ```value types```.