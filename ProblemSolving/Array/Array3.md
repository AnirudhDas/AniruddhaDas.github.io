# Find the number occuring odd number of times in a given array of size 'n'

### Method 1

A **Simple Solution** is to run `two nested loops`. The outer loop picks all elements one by one and inner loop counts number of occurrences of the element picked by outer loop. Time complexity of this solution is `O(n^2)`.

### Method 2

A **Better Solution** is to use `Hashing`. Use array elements as key and their counts as value. Create an empty hash table. One by one traverse the given array elements and store counts. Time complexity of this solution is `O(n)`. But it requires `extra space for hashing`.

### Method 3

The **Best Solution** is to do `bitwise XOR` of all the elements. XOR of all elements gives us odd occurring element. Please note that **XOR of two elements is 0, if both elements are same and XOR of a number x with 0 is x**.

**Implementations in Java:**

```
//Java program to find the element occurring odd number of times
 
class OddOccurance 
{
    int getOddOccurrence(int ar[], int ar_size) 
    {
        int i;
        int res = 0;
        for (i = 0; i < ar_size; i++) 
        {
            res = res ^ ar[i];
        }
        return res;
    }
 
    public static void main(String[] args) 
    {
        OddOccurance occur = new OddOccurance();
        int ar[] = new int[]{2, 3, 5, 4, 5, 2, 4, 3, 5, 2, 4, 4, 2};
        int n = ar.length;
        System.out.println(occur.getOddOccurrence(ar, n));
    }
}
```

**Output:**

```
5
```

**Time Complexity:** `O(n)`