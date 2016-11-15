#include <stdio.h>
#include <stdlib.h>
#include <dos.h>

typedef struct Node
{
    int data; //4 bytes.
    struct Node* next; //4 bytes.
}NODE;

NODE* head; //global node declaration to store address to first node of list.

void traverse() //to print each node.
{
    NODE* loc = head; //loc holds start address of list. We don't want to modify head. So, we use 'loc'.

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

void insert_begin(int x)
{
    NODE* temp; //to store address to temporary node.
    temp = (NODE*) malloc(sizeof(NODE)); /*malloc creates a node of 8 bytes and returns starting address of it, in void type,
    which then needs to be type casted to NODE type, to store in a NODE type pointer. So, temp now holds address of node.*/

    temp->data = x; //dereferencing pointer to modify data at address. It's same as writing, (*temp).data=x;
    temp->next = head; //It's same as writing, (*temp).next=head;
    head = temp;
}

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

void reverseIterative()
{
    NODE *currentnode,*prevnode,*nextnode;

    if(head == NULL)
    {
        printf("Does not exist\n");
        return;
    }

    prevnode = NULL; //Since for the first time, the previous node to 1st node, doesn't exist. So, address is NULL.
    currentnode = head; //Trivially, the first node is current node.

    while(currentnode != NULL) //traverse till end.
    {
        nextnode = currentnode->next; //Store address of Next node.
        currentnode->next = prevnode;

        prevnode = currentnode;
        currentnode = nextnode;
    }

    head = prevnode; //after exit from while loop, prevnode holds address of last node.
}

int main()
{
    int n,i,x,c,data;
    head = NULL; //initially list is empty.

    while(1)
    {
        system("CLS"); //clrscr();

        printf("\n1.  Create a Singly List. \n2.  Traverse. \n3.  Insert at beginning. \n4.  Insert at end. \n5.  Insert at Nth Position. \n6.  Delete from Nth location. \n7.  Reserve List. \n8.  Count Nodes. \n9.  Print Forward and Backward. \n10. Sort List. \n11. Exit. \n\nEnter your choice: ");

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
                    printf("\nThe list is: ");
                    traverse(); //func. call to display.
                    system("PAUSE"); //getch();
                    break;

            case 3:
                    system("CLS"); //clrscr();
                    printf("\nEnter the no. to be inserted: ");
                    scanf("%d",&x);
                    insert_begin(x); //func. call to insert.
                    printf("\nNumber Successfully Inserted.\n");
                    system("PAUSE"); //getch();
                    break;

            case 4:
                    system("CLS"); //clrscr();
                    printf("\nEnter the no. to be inserted: ");
                    scanf("%d",&x);
                    insert_end(x); //func. call to insert.
                    printf("\nNumber Successfully Inserted.\n");
                    system("PAUSE"); //getch();
                    break;

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

            case 11:
                    exit(0);

        }
    }
    return 0;
}
