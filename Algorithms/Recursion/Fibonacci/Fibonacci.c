#include<stdio.h>
#include<time.h>


int fibo(int n)
{
        //non linear recursion
        if(n==0)
        	return 0;
        if(n==1)
            return 1;
        else
            return fibo(n-1)+fibo(n-2);

}


/*
int fibo(int n,int next, int r)
{
        //tail recursion
        if(n==0)
        	return r;
        else
            return fibo(n-1,next+r,next);

}
*/
main()
{
    int i,c;
	clock_t start,end;
	double TIME;
	for(i=5;i<=45;i++)
	{
		start=clock();

        //c=fibo(i,1,0);

		c=fibo(i); //for non linear
        //printf("%d",c);

		end=clock();
		TIME=(double)(end-start)/CLOCKS_PER_SEC;
		printf("\n%lf",TIME);
	}
}
