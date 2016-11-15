#include<stdio.h>
#include<stdlib.h>

typedef struct Node
{
    int data; //4 bytes.
    struct Node* next; //4 bytes.
}NODE;

NODE *top = NULL; //initially stack is empty.

void push(int x) //insert node at beginning of list.
{
    NODE *temp = (NODE *) malloc(sizeof(NODE)); //we create a new node, and 'temp' is a pointer to that node

    temp->data = x;
    temp->next = top;
    top = temp;
}

void pop() //delete node from beginning
{
    NODE *temp = top;

    if(top == NULL)
    {
        printf("\nStack Underflow. Cannot Pop.");
        return;
    }
    top = top->next; //adjusting links.
    temp->next = NULL;
    free(temp);
}

void isEmpty()
{
    if(top == NULL)
    {
        printf("\nStack Empty");
    }
    else
    {
        printf("\nStack not empty");
    }
}

void traverse()
{
    NODE *loc = top;
    if(top == NULL)
    {
        printf("\nStack Empty");
        return;
    }

    printf("\nThe stack is: ");
    while(loc != NULL)
    {
        printf(" %d",loc->data);
        loc = loc->next;
    }
}

int findTop()
{
    return(top->data);
}

int main()
{
    isEmpty();
    push(2);
    push(46);
    traverse();
    pop();
    push(13);
    traverse();
    isEmpty();
    push(4);
    pop();
    traverse();
    push(29);
    findTop();
    traverse();

    return(0);
}
