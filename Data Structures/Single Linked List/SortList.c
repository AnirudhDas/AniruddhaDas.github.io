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

//Bubble Sort Logic.
void sort(int n)
{
    int i,j,t;
    NODE *loc;

    if(head == NULL)
    {
        printf("List is Empty");
        return;
    }

    for(i=0;i<n-1;i++)
    {
        loc = head;

        for(j=0;j<n-i-1;j++)
        {
            if((loc->data) > ((loc->next)->data))
            {
                t=loc->data;
                loc->data = (loc->next)->data;
                (loc->next)->data = t;
            }
        }
    }
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

int main()
{
    int n,data,c;
    head  = NULL; //initially list is empty.

    insert_end(2);//func. call to insert.
    insert_end(4);
    insert_end(6);
    insert_end(5); //list: 2, 4, 6, 5

    printf("\nBefore Sorting: ");
    traverse();

    printf("\nAfter Sorting: ");
    c=count();
    sort(4);
    traverse();

    return 0;
}
