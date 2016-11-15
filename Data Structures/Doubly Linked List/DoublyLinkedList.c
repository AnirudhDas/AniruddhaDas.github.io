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

void insert_end(int x)
{
    NODE *loc = head;
    NODE *newnode = getNode(x);

    if(loc->next != NULL)
    {
        loc=loc->next; //finally 'loc' gives the address of last node.
    }

    newnode->prev = loc;
    loc->next = newnode;
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

    while(loc != NULL)
    {
        printf(" %d",loc->data);
        loc = loc->prev;
    }
}

void delete_begin()
{
    NODE *loc = head;
    head = loc->next;

    if(head != NULL)
    {
        head->prev = NULL;
        loc->next = NULL;
    }
    free(loc);
}

void delete_end()
{
    NODE *loc = head;
    NODE *temp;

    while(loc->next != NULL)
    {
        loc = loc->next; //finally, 'loc' has address of last node.
    }
    temp = loc->prev; //2nd last node, which now will be the last node.
    temp->next = NULL;
    loc->prev = NULL;

    free(loc);
}

///////////////////////////////////void insert_after

void create(int n)
{
    int i,x;

    for(i=0;i<n;i++)
    {
       printf("Enter the no: ");
       scanf("%d",&x);

       insert_end(x); //func. call to insert.
    }
}

int main()
{
    int n,i,x,c,data;
    head = NULL; //initially list is empty.

    while(1)
    {
        system("CLS"); //clrscr();

        printf("\n1.  Create a Doubly List. \n2.  Traverse in Forward Manner. \n3.  Traverse in Backward Manner. \n4.  Insert at beginning. \n5.  Insert at end. \n5.  Insert at Nth Position. \n6.  Delete from Nth location. \n7.  Reserve List. \n8.  Count Nodes. \n9.  Print Forward and Backward. \n10. Sort List. \n11. Exit. \n\nEnter your choice: ");

        scanf("%d",&n);

        switch(n)
        {
            case 1:
                    system("CLS"); //clrscr();
                    printf("Enter number of nodes: \n");
                    scanf("%d",&n);
                    create(n);
                    printf("\nList Successfully Created.\n");
                    system("PAUSE"); //getch();
                    break;

            case 2:
                    system("CLS"); //clrscr();
                    printf("\nThe list in forward manner is: ");
                    traverse_forward(); //func. call to display.
                    system("PAUSE"); //getch();
                    break;

            case 3:
                    system("CLS"); //clrscr();
                    printf("\nThe list in backward manner is: ");
                    traverse_backward(); //func. call to display.
                    system("PAUSE"); //getch();
                    break;

            case 4:
                    system("CLS"); //clrscr();
                    printf("\nEnter the no. to be inserted: ");
                    scanf("%d",&x);
                    insert_begin(x); //func. call to insert.
                    printf("\nNumber Successfully Inserted.\n");
                    system("PAUSE"); //getch();
                    break;

            case 5:
                    system("CLS"); //clrscr();
                    printf("\nEnter the no. to be inserted: ");
                    scanf("%d",&x);
                    insert_end(x); //func. call to insert.
                    printf("\nNumber Successfully Inserted.\n");
                    system("PAUSE"); //getch();
                    break;
/*
            case 5:
                    system("CLS"); //clrscr();
                    printf("\nEnter the new number to be inserted: ");
                    scanf("%d",&data);
                    printf("\nEnter the position where it has to be entered: ");
                    scanf("%d",&n);
                    insert_nth_node(data,n);
                    printf("\nNumber Successfully Inserted.\n");
                    system("PAUSE"); //getch();
                    break;

            case 6:
                    system("CLS"); //clrscr();
                    printf("\nEnter the position: ");
                    scanf("%d",&n);
                    delete_nth_node(n);
                    printf("\nNumber Successfully Deleted.\n");
                    system("PAUSE"); //getch();
                    break;
            case 7:
                    system("CLS"); //clrscr();
                    reverseIterative();
                    printf("\nList Successfully Reversed.\n");
                    system("PAUSE"); //getch();
                    break;

            case 8:
                    system("CLS"); //clrscr();
                    c=count();
                    printf("\nThe no. of nodes = %d\n",c);
                    system("PAUSE"); //getch();
                    break;

            case 9:
                    system("CLS"); //clrscr();
                    printf("\nIn forward manner: \n");
                    printForward(head);

                    printf("\nIn backward manner: \n");
                    printBackward(head);
                    system("PAUSE"); //getch();
                    break;

            case 10:
                    system("CLS"); //clrscr();
                    printf("\nSorted List is: \n");
                    c=count();
                    sort(c);
                    printf("\nList Successfully Sorted. Press any key to see result: \n");
                    system("PAUSE"); //getch();
                    traverse();
                    system("PAUSE"); //getch();
                    break;
*/
            case 11:
                    exit(0);

        }
    }
    return 0;
}
