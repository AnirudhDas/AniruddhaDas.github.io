# Find the triplet whose sum is X

**Problem Statement:**

Given an array and a value, find if there is a triplet in array whose sum is equal to the given value. If there is such a triplet present in array, then print the triplet and return true. Else return false.

**Example:**

If the given array is {12, 3, 4, 1, 6, 9} and given sum is 24, then there is a triplet (12, 3 and 9) present in array whose sum is 24.

### Method 1 (Naive)

A simple method is to generate all possible triplets and compare the sum of every triplet with the given value. The following code implements this simple method using three nested loops.

**Implementation in Java:**

```
class FindTriplet 
{
    // returns true if there is triplet with sum equal
    // to 'sum' present in A[]. Also, prints the triplet
    boolean find3Numbers(int A[], int arr_size, int sum) 
    {
        int l, r;
 
        // Fix the first element as A[i]
        for (int i = 0; i < arr_size - 2; i++) 
        {
            // Fix the second element as A[j]
            for (int j = i + 1; j < arr_size - 1; j++) 
            {
                // Now look for the third number
                for (int k = j + 1; k < arr_size; k++) 
                {
                    if (A[i] + A[j] + A[k] == sum) 
                    {
                        System.out.print("Triplet is " + A[i] + " ," + A[j] 
                                                              + " ," + A[k]);
                        return true;
                    }
                }
            }
        }
 
        // If we reach here, then no triplet was found
        return false;
    }
 
    // Driver program to test above functions
    public static void main(String[] args) 
    {
        FindTriplet triplet = new FindTriplet();
        int A[] = {1, 4, 45, 6, 10, 8};
        int sum = 22;
        int arr_size = A.length;
 
        triplet.find3Numbers(A, arr_size, sum);
    }
}
```

**Output:**

```
Triplet is 4, 10, 8
```

**Time Complexity:** `O(n^3)`

### Method 2 (Use Sorting)

Time complexity of the method 1 is O(n^3). The complexity can be reduced to O(n^2) by sorting the array first, and then using method 1 of this post in a loop.

```
1) Sort the input array.
2) Fix the first element as A[i] where i is from 0 to array size – 2. After fixing the first element of triplet, find the other two elements using method 1 of this post.
```

**Implementation in Java:**

```
class FindTriplet
{
     
    // returns true if there is triplet with sum equal
    // to 'sum' present in A[]. Also, prints the triplet
    boolean find3Numbers(int A[], int arr_size, int sum) 
    {
        int l, r;
 
        /* Sort the elements */
        quickSort(A, 0, arr_size - 1);
 
        /* Now fix the first element one by one and find the
           other two elements */
        for (int i = 0; i < arr_size - 2; i++) 
        {
            // To find the other two elements, start two index variables
            // from two corners of the array and move them toward each
            // other
            l = i + 1; // index of the first element in the remaining elements
            r = arr_size - 1; // index of the last element
            while (l < r) 
            {
                if (A[i] + A[l] + A[r] == sum) 
                {
                    System.out.print("Triplet is " + A[i] + " ," + A[l]
                            + " ," + A[r]);
                    return true;
                }
                else if (A[i] + A[l] + A[r] < sum)
                    l++;
                 
                else // A[i] + A[l] + A[r] > sum
                    r--;
            }
        }
 
        // If we reach here, then no triplet was found
        return false;
    }
 
    int partition(int A[], int si, int ei) 
    {
        int x = A[ei];
        int i = (si - 1);
        int j;
 
        for (j = si; j <= ei - 1; j++) 
        {
            if (A[j] <= x) 
            {
                i++;
                int temp = A[i];
                A[i] = A[j];
                A[j] = temp;
            }
        }
        int temp = A[i + 1];
        A[i + 1] = A[ei];
        A[ei] = temp;
        return (i + 1);
    }
 
    /* Implementation of Quick Sort
    A[] --> Array to be sorted
    si  --> Starting index
    ei  --> Ending index
     */
    void quickSort(int A[], int si, int ei) 
    {
        int pi;
         
        /* Partitioning index */
        if (si < ei) 
        {
            pi = partition(A, si, ei);
            quickSort(A, si, pi - 1);
            quickSort(A, pi + 1, ei);
        }
    }
 
    // Driver program to test above functions
    public static void main(String[] args) 
    {
        FindTriplet triplet = new FindTriplet();
        int A[] = {1, 4, 45, 6, 10, 8};
        int sum = 22;
        int arr_size = A.length;
 
        triplet.find3Numbers(A, arr_size, sum);
    }
}
```

**Output:**

```
Triplet is 4, 8, 10
```

**Time Complexity:** `O(n^2)`