#include <stdio.h>
#include <stdlib.h>

typedef struct Node
{
    int data; //4 bytes.
    struct Node* next; //4 bytes.
}NODE;

NODE* head; //global node declaration to store address to first node of list.

void insert_begin(int x)
{
    NODE* temp; //to store address to temporary node.
    temp = (NODE*) malloc(sizeof(NODE)); /*malloc creates a node of 8 bytes and returns starting address of it, in void type,
    which then needs to be type casted to NODE type, to store in a NODE type pointer. So, temp now holds address of node.*/

    temp->data = x; //dereferencing pointer to modify data at address. It's same as writing, (*temp).data=x;
    temp->next = head; //It's same as writing, (*temp).next=head;
    head = temp;
}

void traverse() //to print each node.
{
    NODE* loc = head; //loc holds start address of list. We don't want to modify head. So, we use 'loc'.
    printf("list is: \n");
    while(loc != NULL)
    {
        printf(" %d",loc->data);
        loc = loc->next;
    }
    printf("\n");
}

int main()
{
    int n,i,x;
    head  = NULL; //initially list is empty.

    printf("How many nodes? \n");
    scanf("%d",&n);

    for(i=0;i<n;i++)
    {
       printf("Enter the no: ");
       scanf("%d",&x);

       insert_begin(x); //func. call to insert.
       traverse(); //func. call to display.
    }

    printf("\nFinally the list is: ");
    traverse(); //func. call to display.
    return 0;
}
