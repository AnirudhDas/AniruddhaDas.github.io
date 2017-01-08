# Find the index in an array such that the sum of elements at lower indices is equal to the sum of elements at higher indices (Equilibrium index of an array)

**Example:**

```
A[0] = -7, A[1] = 1, A[2] = 5, A[3] = 2, A[4] = -4, A[5] = 3, A[6]=0
```

`3 is an equilibrium index`, because:

```
A[0] + A[1] + A[2] = A[4] + A[5] + A[6]
```

### Method 1 (Simple but inefficient)

Use two loops. Outer loop iterates through all the element and inner loop finds out whether the current index picked by the outer loop is equilibrium index or not.

**Implementation in Java:**

```
class EquilibriumIndex 
{
    int equilibrium(int arr[], int n) 
    {
        int i, j;
        int leftsum, rightsum;
 
        /* Check for indexes one by one until an equilibrium
           index is found */
        for (i = 0; i < n; ++i) 
        {
            leftsum = 0;  // initialize left sum for current index i
            rightsum = 0; // initialize right sum for current index i
 
            /* get left sum */
            for (j = 0; j < i; j++)
                leftsum += arr[j];
 
            /* get right sum */
            for (j = i + 1; j < n; j++)
                rightsum += arr[j];
 
            /* if leftsum and rightsum are same, then we are done */
            if (leftsum == rightsum)
                return i;
        }
 
        /* return -1 if no equilibrium index is found */
        return -1;
    }
 
    public static void main(String[] args) 
    {
        EquilibriumIndex equi = new EquilibriumIndex();
        int arr[] = {-7, 1, 5, 2, -4, 3, 0};
        int arr_size = arr.length;
        System.out.println(equi.equilibrium(arr, arr_size));
    }
}
```

**Time Complexity:** `O(n^2)`

### Method 2 (Tricky and Efficient)

The idea is to get total sum of array first. Then iterate through the array and keep updating the left sum which is initialized as zero. In the loop, we can get right sum by subtracting the elements one by one.

**Algorithm:**

```
1) Initialize leftsum  as 0
2) Get the total sum of the array as sum
3) Iterate through the array and for each index i, do following.
    a)  Update sum to get the right sum.  
           sum = sum - arr[i] 
       // sum is now right sum
    b) If leftsum is equal to sum, then return current index. 
    c) leftsum = leftsum + arr[i] // update leftsum for next iteration.
4) return -1 // If we come out of loop without returning then
             // there is no equilibrium index
```

**Implementation in Java:**

```
class EquilibriumIndex 
{
    int equilibrium(int arr[], int n) 
    {
        int i, j;
        int leftsum, rightsum;
 
        /* Check for indexes one by one until an equilibrium
           index is found */
        for (i = 0; i < n; ++i) 
        {
            leftsum = 0;  // initialize left sum for current index i
            rightsum = 0; // initialize right sum for current index i
 
            /* get left sum */
            for (j = 0; j < i; j++)
                leftsum += arr[j];
 
            /* get right sum */
            for (j = i + 1; j < n; j++)
                rightsum += arr[j];
 
            /* if leftsum and rightsum are same, then we are done */
            if (leftsum == rightsum)
                return i;
        }
 
        /* return -1 if no equilibrium index is found */
        return -1;
    }
 
    public static void main(String[] args) 
    {
        EquilibriumIndex equi = new EquilibriumIndex();
        int arr[] = {-7, 1, 5, 2, -4, 3, 0};
        int arr_size = arr.length;
        System.out.println(equi.equilibrium(arr, arr_size));
    }
}
```

**Time Complexity:** `O(n)`