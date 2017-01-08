# Find a continous sub-array whose sum is X (non-negative numbers)

**Examples:**

```
Input: arr[] = {1, 4, 20, 3, 10, 5}, sum = 33
Ouptut: Sum found between indexes 2 and 4

Input: arr[] = {1, 4, 0, 0, 3, 10, 5}, sum = 7
Ouptut: Sum found between indexes 1 and 4

Input: arr[] = {1, 4}, sum = 0
Output: No subarray found
```

### Method 1 (Simple)

A simple solution is to consider all subarrays one by one and check the sum of every subarray. Following program implements the simple solution. We run two loops: the outer loop picks a starting point i and the inner loop tries all subarrays starting from i.

**Implementation in Java:**

```
class SubarraySum 
{
    /* Returns true if the there is a subarray of arr[] with sum equal to
       'sum' otherwise returns false.  Also, prints the result */
    int subArraySum(int arr[], int n, int sum) 
    {
        int curr_sum, i, j;
 
        // Pick a starting point
        for (i = 0; i < n; i++) 
        {
            curr_sum = arr[i];
 
            // try all subarrays starting with 'i'
            for (j = i + 1; j <= n; j++) 
            {
                if (curr_sum == sum) 
                {
                    int p = j - 1;
                    System.out.println("Sum found between indexes " + i
                            + " and " + p);
                    return 1;
                }
                if (curr_sum > sum || j == n)
                    break;
                curr_sum = curr_sum + arr[j];
            }
        }
 
        System.out.println("No subarray found");
        return 0;
    }
 
    public static void main(String[] args) 
    {
        SubarraySum arraysum = new SubarraySum();
        int arr[] = {15, 2, 4, 8, 9, 5, 10, 23};
        int n = arr.length;
        int sum = 23;
        arraysum.subArraySum(arr, n, sum);
    }
}
```

**Output:**

```
Sum found between indexes 1 and 4
```

**Time Complexity:** `O(n^2)`

### Method 2 (Efficient)

Initialize a variable curr_sum as first element. curr_sum indicates the sum of current subarray. Start from the second element and add all elements one by one to the curr_sum. If curr_sum becomes equal to sum, then print the solution. If curr_sum exceeds the sum, then remove trailing elemnents while curr_sum is greater than sum.

**Implementation in Java:**

```
class SubarraySum
{
    /* Returns true if the there is a subarray of arr[] with sum equal to
       'sum' otherwise returns false.  Also, prints the result */
    int subArraySum(int arr[], int n, int sum) 
    {
        int curr_sum = arr[0], start = 0, i;
 
        // Pick a starting point
        for (i = 1; i <= n; i++) 
        {
            // If curr_sum exceeds the sum, then remove the starting elements
            while (curr_sum > sum && start < i-1)
            {
                curr_sum = curr_sum - arr[start];
                start++;
            }
             
            // If curr_sum becomes equal to sum, then return true
            if (curr_sum == sum) 
            {
                int p = i-1;
                System.out.println("Sum found between indexes " + start
                        + " and " + p);
                return 1;
            }
             
            // Add this element to curr_sum
            if (i < n)
            curr_sum = curr_sum + arr[i];
             
        }
 
        System.out.println("No subarray found");
        return 0;
    }
 
    public static void main(String[] args) 
    {
        SubarraySum arraysum = new SubarraySum();
        int arr[] = {15, 2, 4, 8, 9, 5, 10, 23};
        int n = arr.length;
        int sum = 23;
        arraysum.subArraySum(arr, n, sum);
    }
}
```

**Output:**

```
Sum found between indexes 1 and 4
```

**Time Complexity:** `O(n)`

**Note:** The above solution doesn’t handle negative numbers. We can using hashing to handle negative numbers.