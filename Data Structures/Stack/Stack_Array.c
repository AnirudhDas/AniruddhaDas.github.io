#include<stdio.h>
#define MAX 50
int a[MAX];
int top = -1;

int isFull()
{
    if(top == MAX-1)
        return 1;
    else
        return 0;
}

int isEmpty()
{
    if(top == -1)
        return 1;
    else
        return 0;
}

void push(int x) //takes constant time, i.e. O(1)
{
    if(isFull())
    {
        printf("\nStack Overflow");
        return;
    }
    top = top+1;
    a[top] = x;
}

void pop() //takes constant time, i.e. O(1)
{
    if(isEmpty())
    {
        printf("\nStack Underflow");
        return;
    }
    top = top-1;
}

int getTop()
{
    return (a[top]);
}

int main()
{
    int i;

    push(2);
    push(17);
    push(35);
    pop();
    push(12);

    printf("\nStack is: ");
    for(i=0;i<=top;i++)
    {
        printf("%d ",a[i]);
    }
    return 0;
}
