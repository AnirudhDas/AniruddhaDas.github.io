#include <stdio.h>
#include <stdlib.h>

typedef struct Node
{
    int data; //4 bytes.
    struct Node* next; //4 bytes.
}NODE;

NODE* head; //global node declaration to store address to first node of list.

void insert_end(int x)
{
    NODE* temp; //to store address to temporary node.
    NODE* loc = head;

    temp = (NODE*) malloc(sizeof(NODE)); /*malloc creates a node of 8 bytes and returns starting address of it, in void type,
    which then needs to be type casted to NODE type, to store in a NODE type pointer. So, temp now holds address of node.*/
    temp->data = x; //dereferencing pointer to modify data at address.
    temp->next = NULL;

    if(loc == NULL)
    {
        head = temp;
        return;
    }
    else
    {
        while(loc->next != NULL) //till we reach the end of the list.
        {
            loc = loc->next; //finally loc with have the address of last node.
        }

        loc->next = temp;
    }
}

void reverseRecursive(NODE *loc)
{
    if(loc->next == NULL) //exit condition. Recursion ends when we reach the last node.
    {
        head = loc; //Make head point to last node.
        return;
    }
    reverseRecursive(loc->next); //recursive call.
    NODE *temp = loc->next; //next node.
    temp->next = loc;
    loc->next = NULL;
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
    int n;
    head  = NULL; //initially list is empty.

    insert_end(2);//func. call to insert.
    insert_end(4);
    insert_end(6);
    insert_end(5); //list: 2, 4, 6, 5

    traverse();

    reverseRecursive(head);

    printf("After reversing: \n");
    traverse();

    return 0;
}
