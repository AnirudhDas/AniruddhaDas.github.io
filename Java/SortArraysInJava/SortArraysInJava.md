# How to Sort Arrays in Java using `java.util.Arrays` class

You can use following method to sort any array in Java:

```
import java.util.Arrays;
...
...
Arrays.sort (int [])
Arrays.sort (String [])
Arrays.sort (float [])
Arrays.sort (double [])
Arrays.sort (long [])
Arrays.sort (Object [])
...
```

Let us check an example where we will sort an array of String in ascending as well as descending order.

Here is a string array we defined in Java:

```
String [] stringArray = {"ab", "aB", "c", "0", "2", "1Ad", "a10"};
		
System.out.println("****** Unsorted String Array *******");
for (String str : stringArray) {
	System.out.println(str);
}
```

**Output:**

```
****** unsorted string *******
ab
aB
c
0
2
1Ad
a10
```

In above code, we simpley defined an array of String and printed its value. Now let's sort this array in ascending order using `Arrays.sort()` method.

### Sort in Ascending Order

```
//Sort array in ascending order
Arrays.sort(stringArray);

System.out.println("****** Sorted String Array *******");
for (String str : stringArray) {
	System.out.println(str);
}
```

**Output:**

```
****** Sorted String Array *******
0
1Ad
2
a10
aB
ab
c
```

### Sort in Descending Order

Now let's try to sort the array in reverse order. For this we will use a different signature of sort method.

```
Arrays.sort (Object [], Comparator)
```

Following is the code to sort array in reverse order.

```
//Sort array in reverse order
Arrays.sort(stringArray, Collections.reverseOrder());

System.out.println("****** Reverse Sorted String Array *******");
for (String str : stringArray) {
	System.out.println(str);
}
```

**Output:**

```
****** Reverse Sorted String Array *******
c
ab
aB
a10
2
1Ad
0
```

### Selective Sorting

Using `Arrays.sort()` method it is possible to sort an array selectively. i.e. if you want a subpart of array to be sorted, that is possible using following method.

```
Arrays.sort (Object [], int startIndex, int endIndex)
```

In following code we are sorting the array starting from index 3 till the end.

```
//Sorting array starting from index 3 till 6
Arrays.sort(stringArray, 3, 6);

System.out.println("****** Selective Sort String Array *******");
for (String str : stringArray) {
	System.out.println(str);
}
```

**Output:**

```
****** Selective Sort String Array *******
ab
aB
c
0
1Ad
2
a10
```