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

void printForward(NODE *loc) //here 'loc'is the head node, but it acts as a local variable.
{
    if(loc == NULL) //exit condition.
    return;

    printf(" %d", loc->data); //print the value.
    printForward(loc->next); //recursive call to itself.
}

void printBackward(NODE *loc) //here 'loc'is the head node, but it acts as a local variable.
{
    if(loc == NULL) //exit condition.
    return;

    printBackward(loc->next); //recursive call to itself.
    printf(" %d", loc->data); //print the value.
}

int main()
{
    int n;
    head  = NULL; //initially list is empty.

    insert_end(2);//func. call to insert.
    insert_end(4);
    insert_end(6);
    insert_end(5); //list: 2, 4, 6, 5

    printf("\nIn forward manner: \n");
    printForward(head);

    printf("\nIn backward manner: \n");
    printBackward(head);

    return 0;
}
