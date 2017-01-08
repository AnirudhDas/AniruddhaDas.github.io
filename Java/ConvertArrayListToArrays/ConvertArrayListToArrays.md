# Convert ArrayList to Arrays and vice versa

### Convert ArrayList to Arrays

ArrayList class has a method called toArray() that we are using in our example to convert it into Arrays.

Following is simple code snippet that converts an array list of countries into string array.

```
List<String> list = new ArrayList<String>();
		
list.add("India");
list.add("Switzerland");
list.add("Italy");
list.add("France");
	
String [] countries = list.toArray(new String[list.size()]);
```

So to convert ArrayList of any class into array use following code. Convert `T` into the class whose arrays you want to create.

```
List<T> list = new ArrayList<T>();
	
T [] countries = list.toArray(new T[list.size()]);
```

### Convert Array to ArrayList

Following is the small code snippet that converts an Array to ArrayList:

```
import java.util.ArrayList;
import java.util.List;
import java.util.Arrays;

...

String[] countries = {"India", "Switzerland", "Italy", "France"};
List list = Arrays.asList(countries);
System.out.println("ArrayList of Countries:" + list);
```

The above code will work great. But list object is `immutable`. Thus you will not be able to add new values to it. In case you try to add new value to list, it will throw `UnsupportedOperationException`.

Thus simply create a new List from that object. See below:

```
String[] countries = {"India", "Switzerland", "Italy", "France"};
List list = new ArrayList(Arrays.asList(countries));
System.out.println("ArrayList of Countries:" + list);
```