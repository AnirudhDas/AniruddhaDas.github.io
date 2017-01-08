# Convert Arrays to Set in Java

Use below code to Convert Arrays to Set in Java:

```
Set<T> mySet = new HashSet<T>(Arrays.asList(someArray));
```

Checkout below example:

```
String [] countries = {"India", "Switzerland", "Italy"}; 
		
Set<String> set = new HashSet<String>(Arrays.asList(countries));
System.out.println(set);
```

**Output:**

```
[Italy, Switzerland, India]
```