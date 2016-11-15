#include<stdio.h>
#include<stdlib.h>
#include<dos.h>

typedef struct Node //12 bytes for one node.
{
    struct Node *prev; //4 bytes
    int data; //4 bytes
    struct Node *next; //4 bytes
}NODE;

NODE *head; //global pointer which points to head node.

NODE* getNode(int x)
{
    NODE* temp; //to store address to temporary node.

    temp = (NODE*) malloc(sizeof(NODE)); /*malloc creates a node of 8 bytes and returns starting address of it, in void type,
    which then needs to be type casted to NODE type, to store in a NODE type pointer. So, temp now holds address of node.*/

    temp->prev = NULL;
    temp->data = x; //dereferencing pointer to modify data at address.
    temp->next = NULL;

    return temp; //returns address to newly created node.
}

void insert_begin(int x)
{
    NODE *newnode = getNode(x);

    if(head == NULL)
    {
        head = newnode;
        return;
    }
    head->prev = newnode;
    newnode->next = head;
    head = newnode;
}

void traverse_forward()
{
    NODE *loc = head;

    while(loc != NULL)
    {
        printf(" %d",loc->data);
        loc = loc->next;
    }
}

void traverse_backward()
{
    NODE *loc = head;

    if(loc == NULL)
    {
        printf("\nList is empty.");
        return;
    }

    if(loc->next != NULL)
    {
        loc=loc->next; //finally 'loc' gives the address of last node.
    }

    printf("\n%d\n",loc->data);

    while(loc != NULL)
    {
        printf(" %d",loc->data);
        loc = loc->prev;
    }
}

int main()
{
    head = NULL; //initially list is empty.

    insert_begin(2);
    printf("\nList in forward manner is:");
    traverse_forward();
    printf("\nList in backward manner is:");
    traverse_backward();
    printf("\n\n");

    insert_begin(4);
    printf("\nList in forward manner is:");
    traverse_forward();
    printf("\nList in backward manner is:");
    traverse_backward();
    printf("\n\n");

    insert_begin(6);
    printf("\nList in forward manner is:");
    traverse_forward();
    printf("\nList in backward manner is:");
    traverse_backward();
    printf("\n\n");

    insert_begin(7);
    printf("\nList in forward manner is:");
    traverse_forward();
    printf("\nList in backward manner is:");
    traverse_backward();
    printf("\n\n");

    insert_begin(8);
    printf("\nList in forward manner is:");
    traverse_forward();
    printf("\nList in backward manner is:");
    traverse_backward();
    printf("\n\n");

    insert_begin(9);
    printf("\nList in forward manner is:");
    traverse_forward();
    printf("\nList in backward manner is:");
    traverse_backward();
    printf("\n\n");

    return 0;
}
