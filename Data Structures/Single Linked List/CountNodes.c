
#include <stdio.h>
#include <stdlib.h>

typedef struct Node
{
    int data; //4 bytes.
    struct Node* next; //4 bytes.
}NODE;

NODE* head; //global node declaration to store address to first node of list.

void traverse() //to print each node.
{
    NODE* loc = head; //loc holds start address of list. We don't want to modify head. So, we use 'loc'.
    printf("list is: \n");

    while(loc != NULL) //till we reach the end of the list.
    {
        printf(" %d",loc->data);
        loc = loc->next;
    }
    printf("\n");
}

int count() //to count each node.
{
    int count = 0;
    NODE* loc = head; //loc holds start address of list. We don't want to modify head. So, we use 'loc'.

    while(loc != NULL) //till we reach the end of the list.
    {
        count++;
        loc = loc->next;
    }
    return count;
}

void insert_end(int x)
{
    NODE* temp; //to store address to temporary node.
    NODE* loc = head;

    temp = (NODE*) malloc(sizeof(NODE)); /*malloc creates a node of 8 bytes and returns starting address of it, in void type,
    which then needs to be type casted to NODE type, to store in a NODE type pointer. So, temp now holds address of node.*/

    temp->data = x; //dereferencing pointer to modify data at address.
    temp->next = NULL;

    if(loc == NULL) //no node inserted yet.
    {
        head = temp;
        return;
    }
    else //a list already exists.
    {
        while(loc->next != NULL) //till we reach the end of the list.
        {
            loc = loc->next; //finally loc with have the address of last node.
        }

        loc->next = temp; //add the new node at the end of last node, by adjusting links.
    }
}

int main()
{
    int n,i,x,c,data;
    head = NULL; //initially list is empty.

    printf("How many nodes? \n");
    scanf("%d",&n);

    for(i=0;i<n;i++)
    {
       printf("Enter the no: ");
       scanf("%d",&x);

       insert_end(x); //func. call to insert.
    }

    traverse(); //func. call to display.

    c = count();
    printf("\nThe no. of nodes = %d",c);
    return 0;
}
