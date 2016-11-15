# Tower of Hanoi

### Source Code

```
#include<stdio.h>
#include<time.h>

void tower(int n,char S,char A,char D)
{
	if(n==1)
        ;
		//printf("\n%c -> %c ",S,D);
	else
	{
		tower(n-1,S,D,A);
        //printf("\n%c -> %c ",S,D);
		tower(n-1,A,S,D);
	}
}
int main()
{
	int n;
	clock_t t;
	double TIME;

    //printf("Enter the no. of disks: ");
	//scanf("%d",&n);

    tower(n,'S','A','D');

    for(n=3;n<=35;n++)
	{
		t=clock(); //initial time

		tower(n,'S','A','D');

		t=clock()-t; //current time - previous time
		TIME=(double)t/CLOCKS_PER_SEC;
		printf("\n%lf",TIME);
	}
	return(0);
}
```