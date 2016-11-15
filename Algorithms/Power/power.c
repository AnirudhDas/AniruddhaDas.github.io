#include<stdio.h>
#include<math.h>

int power(int x,int y)
{
        /*

        //O(1) solution

        return(pow(x,y));
    */

    /*
        //O(n) solution

        if(y==0)
                return 1;
        else if(y%2==0)
              return(power(x,y/2)*power(x,y/2));
        else
               return(x * power(x,y/2)*power(x,y/2));
        */

         //O(log n) solution

            if(y==0)
                return 1;
        else if(y%2==0)
              return(power(x*x,y/2));
        else
               return(x * power(x*x,(y-1)/2));
}
void main()
{
	int a,b,c;

	printf("enter the nos.: ");
     	scanf("%d%d",&a,&b);
	c=power(a,b);
	printf("Pow= %d",c);
}
