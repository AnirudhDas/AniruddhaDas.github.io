#include <stdio.h>
#include <stdlib.h>

typedef struct Node
{
    int data; //4 bytes.
    struct Node* next; //4 bytes.
}NODE;

NODE* head; //global node declaration to store address to first node of list.

void insert_nth_node(int x,int n)
{
    int i;
    NODE* temp; //to store address to temporary node.

    temp = (NODE*) malloc(sizeof(NODE)); /*malloc creates a node of 8 bytes and returns starting address of it, in void type,
    which then needs to be type casted to NODE type, to store in a NODE type pointer. So, temp now holds address of node.*/
    temp->data = x; //dereferencing pointer to modify data at address.
    temp->next = NULL;

    if(n == 1) //when there is only one pre-existing node.
    {
        temp->next = head;
        head = temp;
        return;
    }
    else
    {
         NODE* loc = head;

        for(i=0;i<(n-2);i++) //runs (n-1) times.
        {
            loc = loc->next; //(n-1)th node.
        }

        //Fixing links...
        temp->next = loc->next; //Here, temp is the newly created node.
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

int main()
{
    int n,data;
    head  = NULL; //initially list is empty.

    insert_end(2);//func. call to insert.
    insert_end(4);
    insert_end(6);
    insert_end(5); //list: 2, 4, 6, 5
    traverse();

    printf("Enter the new number to be inserted: \n");
    scanf("%d",&data);

    printf("Enter the position where it has to be entered: \n");
    scanf("%d",&n);

    insert_nth_node(data,n);
    traverse();

    return 0;
}
