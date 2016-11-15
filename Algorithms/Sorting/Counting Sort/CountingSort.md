# Counting Sort

### Source Code

```
#include<stdio.h>
int largest(int ar[],int n)
{
	int l=ar[0],i;
	for(i=1;i<n;i++)
	{
		if(l<ar[i])
			l=ar[i];
	}
	return l;
}
void count_sort(int ar[],int l,int n)
{
	int Arr[l+1],i,j;
	for(i=1;i<=l;i++)
		Arr[i]=0;
	for(i=0;i<n;i++)
	{
		Arr[ar[i]]++;
	}
	for(i=1;i<=l;i++)
	{
		if(Arr[i]!=0)
		{
			for(j=0;j<Arr[i];j++)
			{
				printf("%d  ",i);
			}
		}
	}
}
	
void main()
{
	int l,n,i;
	printf("Enter the size of the array: ");
	scanf("%d",&n);
	int ar[n];
	printf("Enter the elements: \n");
	for(i=0;i<n;i++)
		scanf("%d",&ar[i]);
	printf("Sorted Array\n");
	l=largest(ar,n);
	count_sort(ar,l,n);
}
```