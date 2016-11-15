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

void delete_nth_node(int n)
{
    //Step 1: Fix the links.
    //Step 2: Free the space occupied by node.
    //we first traverse till (n-1)th node, and then fix the links.

    NODE* loc = head;
    NODE* loc1;
    int i;

    if(n==1) //if we need to delete 1st node.
    {
        head = loc->next;
        free(loc);
        return;
    }

    for(i=0;i<(n-2);i++) //runs (n-1) times.
    {
        loc = loc->next; //(n-1)th node.

        loc1 = loc->next; //nth node.

        loc->next = loc1->next; //fixing links.

        free(loc1); //delete nth node.
    }

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

    printf("Enter the position: \n");
    scanf("%d",&n);

    delete_nth_node(n);
    traverse();

    return 0;
}
