# Find the maximum difference of j - i such that a[j] > a[i], for a given an array of 'n' elements

**Example:**

```
Input: {34, 8, 10, 3, 2, 80, 30, 33, 1}
  Output: 6  (j = 7, i = 1)

  Input: {9, 2, 3, 4, 5, 6, 7, 8, 18, 0}
  Output: 8 ( j = 8, i = 0)

  Input:  {1, 2, 3, 4, 5, 6}
  Output: 5  (j = 5, i = 0)

  Input:  {6, 5, 4, 3, 2, 1}
  Output: -1
```

**Algorithm:**

Run two loops. In the outer loop, pick elements one by one from left. In the inner loop, compare the picked element with the elements starting from right side. Stop the inner loop when you see an element greater than the picked element and keep updating the maximum j-i so far.

**Implementation in Java:**

```
class FindMaximum 
{
    /* For a given array arr[], returns the maximum j-i such that
       arr[j] > arr[i] */
    int maxIndexDiff(int arr[], int n) 
    {
        int maxDiff = -1;
        int i, j;
 
        for (i = 0; i < n; ++i) 
        {
            for (j = n - 1; j > i; --j) 
            {
                if (arr[j] > arr[i] && maxDiff < (j - i))
                    maxDiff = j - i;
            }
        }
 
        return maxDiff;
    }
 
    /* Driver program to test above functions */
    public static void main(String[] args) 
    {
        FindMaximum max = new FindMaximum();
        int arr[] = {9, 2, 3, 4, 5, 6, 7, 8, 18, 0};
        int n = arr.length;
        int maxDiff = max.maxIndexDiff(arr, n);
        System.out.println(maxDiff);
    }
}
```

**Time Complexity:** `O(n^2)`