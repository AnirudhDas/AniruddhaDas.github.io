# Find two repeating numbers in a given array

**Problem Statement:**

You are given an array of n+2 elements. All elements of the array are in range 1 to n. And all elements occur once except two numbers which occur twice. Find the two repeating numbers.

**Example:**

Array = `{4, 2, 4, 5, 2, 3, 1}` and n = 5

The above array has n + 2 = 7 elements with all elements occurring once except 2 and 4 which occur twice. So the output should be 4 2.

### Method 1 (Basic)

Use two loops. In the outer loop, pick elements one by one and count the number of occurrences of the picked element in the inner loop.

This method doesn’t use the other useful data provided in questions like range of numbers is between 1 to n and there are only two repeating elements.

**Implementation in Java:**

```
class RepeatElement 
{
    void printRepeating(int arr[], int size) 
    {
        int i, j;
        System.out.println("Repeated Elements are :");
        for (i = 0; i < size; i++) 
        {
            for (j = i + 1; j < size; j++) 
            {
                if (arr[i] == arr[j]) 
                    System.out.print(arr[i] + " ");
            }
        }
    }
 
    public static void main(String[] args) 
    {
        RepeatElement repeat = new RepeatElement();
        int arr[] = {4, 2, 4, 5, 2, 3, 1};
        int arr_size = arr.length;
        repeat.printRepeating(arr, arr_size);
    }
}
```

**Time Complexity:** `O(n^2)`

**Auxiliary Space:** `O(1)`

### Method 2 (Use Count array)

Traverse the array once. While traversing, keep track of count of all elements in the array using a temp array count[] of size n, when you see an element whose count is already set, print it as duplicate.

This method uses the range given in the question to restrict the size of count[], but doesn’t use the data that there are only two repeating elements.

**Implementation in Java:**

```
class RepeatElement
{
    void printRepeating(int arr[], int size) 
    {
        int count[] = new int[size];
        int i;
 
        System.out.println("Repeated elements are : ");
        for (i = 0; i < size; i++) 
        {
            if (count[arr[i]] == 1)
                System.out.print(arr[i] + " ");
            else
                count[arr[i]]++;
        }
    }
 
    public static void main(String[] args)
    {
        RepeatElement repeat = new RepeatElement();
        int arr[] = {4, 2, 4, 5, 2, 3, 1};
        int arr_size = arr.length;
        repeat.printRepeating(arr, arr_size);
    }
}
```

**Time Complexity:** `O(n)`

**Auxiliary Space:** `O(n)`

### Method 3 (Make two equations)

Let the numbers which are being repeated are X and Y. We make two equations for X and Y and the simple task left is to solve the two equations.

We know the `sum of integers from 1 to n is n(n+1)/2` and `product is n!`. We calculate the sum of input array, when this sum is subtracted from n(n+1)/2, we get X + Y because X and Y are the two numbers missing from set [1...n]. Similarly calculate product of input array, when this product is divided from n!, we get X*Y. Given sum and product of X and Y, we can find easily out X and Y.

**Example:**

```
Let summation of all numbers in array be S and product be P

X + Y = S – n(n+1)/2
XY = P/n!

Using above two equations, we can find out X and Y. For array = 4 2 4 5 2 3 1, we get S = 21 and P as 960.

X + Y = 21 – 15 = 6

XY = 960/5! = 8

X – Y = sqrt((X+Y)^2 – 4*XY) = sqrt(4) = 2

Using below two equations, we easily get X = (6 + 2)/2 and Y = (6-2)/2
X + Y = 6
X – Y = 2
```

**Implementation in Java:**

```
class RepeatElement
{
    void printRepeating(int arr[], int size) 
    {
        /* S is for sum of elements in arr[] */
        int S = 0;
         
        /* P is for product of elements in arr[] */
        int P = 1;
         
        /* x and y are two repeating elements */
        int x, y;
         
        /* D is for difference of x and y, i.e., x-y*/
        int D;
         
        int n = size - 2, i;
 
        /* Calculate Sum and Product of all elements in arr[] */
        for (i = 0; i < size; i++) 
        {
            S = S + arr[i];
            P = P * arr[i];
        }
 
        /* S is x + y now */
        S = S - n * (n + 1) / 2;
         
        /* P is x*y now */
        P = P / fact(n);
        
        /* D is x - y now */
        D = (int) Math.sqrt(S * S - 4 * P);
         
 
        x = (D + S) / 2;
        y = (S - D) / 2;
 
        System.out.println("The two repeating elements are :");
        System.out.print(x + " " + y);
    }
 
    int fact(int n) 
    {
        return (n == 0) ? 1 : n * fact(n - 1);
    }
 
    public static void main(String[] args) {
        RepeatElement repeat = new RepeatElement();
        int arr[] = {4, 2, 4, 5, 2, 3, 1};
        int arr_size = arr.length;
        repeat.printRepeating(arr, arr_size);
    }
}
```

**Time Complexity:** `O(n)`

**Auxiliary Space:** `O(1)`

### Method 4 (Use array elements as index)

```
Traverse the array. Do following for every index i of A[].
{
check for sign of A[abs(A[i])] ;
if positive then
   make it negative by   A[abs(A[i])]=-A[abs(A[i])];
else  // i.e., A[abs(A[i])] is negative
   this   element (ith element of list) is a repetition
}
```

**Example:**

```
A[] =  {1, 1, 2, 3, 2}
i=0; 
Check sign of A[abs(A[0])] which is A[1].  A[1] is positive, so make it negative. 
Array now becomes {1, -1, 2, 3, 2}

i=1; 
Check sign of A[abs(A[1])] which is A[1].  A[1] is negative, so A[1] is a repetition.

i=2; 
Check sign of A[abs(A[2])] which is A[2].  A[2] is  positive, so make it negative. '
Array now becomes {1, -1, -2, 3, 2}

i=3; 
Check sign of A[abs(A[3])] which is A[3].  A[3] is  positive, so make it negative. 
Array now becomes {1, -1, -2, -3, 2}

i=4; 
Check sign of A[abs(A[4])] which is A[2].  A[2] is negative, so A[4] is a repetition.
```

Note that this method modifies the original array and may not be a recommended method if we are not allowed to modify the array.

**Implementation in Java:**

```
class RepeatElement
{
    void printRepeating(int arr[], int size)
    {
        int i;  
        System.out.println("The repeating elements are : ");
    
        for(i = 0; i < size; i++)
        {
            if(arr[Math.abs(arr[i])] > 0)
                arr[Math.abs(arr[i])] = -arr[Math.abs(arr[i])];
            else
                System.out.print(Math.abs(arr[i]) + " ");
        }         
    } 
 
    /* Driver program to test the above function */
    public static void main(String[] args) 
    {
        RepeatElement repeat = new RepeatElement();
        int arr[] = {4, 2, 4, 5, 2, 3, 1};
        int arr_size = arr.length;
        repeat.printRepeating(arr, arr_size);
    }
}
```