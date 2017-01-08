# Find a majority element in an array of size 'n'

**Majority Element:** A majority element in an array A[] of size n is an element that appears `more than n/2 times` (and hence there is at most one such element).

**Problem Statement:** Write a function which takes an array and emits the majority element (if it exists), otherwise prints NONE as follows:

```
I/P : 3 3 4 2 4 4 2 4 4
O/P : 4 

I/P : 3 3 4 2 4 4 2 4
O/P : NONE
```

### METHOD 1 (Basic)

The basic solution is to have two loops and keep track of maximum count for all different elements. If maximum count becomes greater than n/2 then break the loops and return the element having maximum count. If maximum count doesn’t become more than n/2 then majority element doesn’t exist.

**Implementation in C:**

```
findMajorityElement(int A[], int n)
{
	int limit=n/2;
	int count;
	
	for(i=0;i<n;i++)
	{
		count=0;
		for(j=0;j<n;j++)
		{
			if(A[i]==A[j])
			{
				count++;
			}
		}
		if(count>limit)
		{
			print("Majority Element is %d",A[i]);
			break;
		}
	}
}
```

**Time Complexity:** `O(n*n)`

**Auxiliary Space:** `O(1)`

### METHOD 2 (Using Binary Search Tree)

Node of the Binary Search Tree (used in this approach) will be as follows:

```
struct tree
{
  int element;
  int count;
}BST;
```

Now, insert elements in BST one by one and if an element is already present, then increment the count of the node. At any stage, if count of a node becomes more than n/2 then return.

The method works well for the cases where `n/2+1` occurrences of the majority element is present in the `starting of the array`; for example `{1, 1, 1, 1, 1, 2, 3, 4}`.

**Time Complexity:** If a `binary search tree` is used, then time complexity will be `O(n^2)`. If a `self-balancing-binary-search tree` is used, then `O(nlogn)`.

**Auxiliary Space:** `O(n)`

### METHOD 3 (Using Moore’s Voting Algorithm)

This is a two step process.

**1. Finding a Candidate:**

The algorithm for first phase that works in O(n) is known as Moore’s Voting Algorithm. Basic idea of the algorithm is if we cancel out each occurrence of an element e with all the other elements that are different from e then e will exist till end if it is a majority element.

```
findCandidate(a[], size)
1.  Initialize index and count of majority element
     maj_index = 0, count = 1
2.  Loop for i = 1 to size – 1
    (a) If a[maj_index] == a[i]
          count++
    (b) Else
        count--;
    (c) If count == 0
          maj_index = i;
          count = 1
3.  Return a[maj_index]
```

Above algorithm loops through each element and maintains a count of a[maj_index], If next element is same then increments the count, if next element is not same then decrements the count, and if the count reaches 0 then changes the maj_index to the current element and sets count to 1.

First Phase algorithm gives us a candidate element. In second phase we need to check if the candidate is really a majority element. Second phase is simple and can be easily done in O(n). We just need to check if count of the candidate element is greater than n/2.

**2. Check if the element obtained in Step 1 is majority**

```
printMajority (a[], size)
1.  Find the candidate for majority
2.  If candidate is majority. i.e., appears more than n/2 times.
       Print the candidate
3.  Else
       Print "NONE"
```

**Implementation in Java:**

```
/* Program for finding out majority element in an array */
 
class MajorityElement 
{
    /* Function to print Majority Element */
    void printMajority(int a[], int size) 
    {
        /* Find the candidate for Majority*/
        int cand = findCandidate(a, size);
 
        /* Print the candidate if it is Majority*/
        if (isMajority(a, size, cand))
            System.out.println(" " + cand + " ");
        else
            System.out.println("No Majority Element");
    }
 
    /* Function to find the candidate for Majority */
    int findCandidate(int a[], int size) 
    {
        int maj_index = 0, count = 1;
        int i;
        for (i = 1; i < size; i++) 
        {
            if (a[maj_index] == a[i])
                count++;
            else
                count--;
            if (count == 0)
            {
                maj_index = i;
                count = 1;
            }
        }
        return a[maj_index];
    }
 
    /* Function to check if the candidate occurs more
       than n/2 times */
    boolean isMajority(int a[], int size, int cand) 
    {
        int i, count = 0;
        for (i = 0; i < size; i++) 
        {
            if (a[i] == cand)
                count++;
        }
        if (count > size / 2) 
            return true;
        else
            return false;
    }
 
    /* Driver program to test the above functions */
    public static void main(String[] args) 
    {
        MajorityElement majorelement = new MajorityElement();
        int a[] = new int[]{1, 3, 3, 1, 2};
        int size = a.length;
        majorelement.printMajority(a, size);
    }
}
```

**Output:**

```
No Majority Element
```
 
**Time Complexity:** `O(n)`

**Auxiliary Space:** `O(1)`