# Dijkstra's Algorithm for Single Source Shortest Path (SSSP)

### Source Code

```
#include<stdio.h>
#include<stdlib.h>
#include<assert.h>
#define MAX 32767
#define NIL -1

typedef struct info
{
    int parent;
    int vertex;
    int weight;
}info;

typedef struct alist
{
    int vertex;
    int weight;
    struct alist *next;
}alist;

void dijkstra(info *vertexlist,alist **adjlist,int n,int r);
void minheapify(info *A,int heapsize,int index);
void buildminheap(info *A, int heapsize);
void heapdecreasekey(info *A,int w,int index);
info extractmin(info *A,int heapsize);

int main()
{

    FILE *fp;
    int n,i,j,temp,r,l=0;
    int **W,cost;
    info *vertexlist;
    alist **adjlist,*head,*newnode,*tail,*v;
    int cnt =0,a;


    fp = fopen("dijkstra.txt","r");
    assert(fp);

	fscanf(fp,"%d",&n); //no. of vertices.

	fscanf(fp,"%d",&r); //starting vertex.

   	W = (int**)calloc(sizeof(int*),n); //creates 'n' rows.

	for(i=0;i<n;i++)
		W[i]=(int*)calloc(sizeof(int),n); //slices each row into 'n' colomns.
	assert(W);

    	for(i=0;i<n;i++)
	{
		for(j=0;j<n;j++)
		{
			fscanf(fp,"%d",&W[i][j]);

		}
	}

    vertexlist = (info*)calloc(sizeof(info),n);

    adjlist = (alist**)calloc(sizeof(alist),n);

    for(i=0;i<n;i++)
    {
        vertexlist[i].parent=NIL;
        vertexlist[i].weight = MAX;
        vertexlist[i].vertex= i;
        head=NULL;

        for(j=0;j<n;j++)
        {
            printf("%d  ",W[i][j]);
            temp = W[i][j];
            if(temp!=0)
            {
                newnode=(alist*)malloc(sizeof(alist));
                newnode->next=NULL;
                newnode->vertex=j;
                newnode->weight=temp;

                if(head==NULL)
                    head=newnode;
                else
                    tail->next=newnode;
                    tail=newnode;
            }

        }
        adjlist[i]=head;
        printf("\n");
    }

    cost=0;
	dijkstra(vertexlist,adjlist,n,r);

    printf("The adjacency list is :\n");
    for(i=0;i<n;i++)
    {
        printf("%d :",i+1);
        v=adjlist[i];
        while(v!=NULL)
        {
            printf("%d->",v->vertex+1);
            v=v->next;
        }
        printf("\n");
    }


    printf("\n Shortest path:\n");
    for(i=0;i<n;i++)
    {
	if(i!=r)
	{
           printf("%d -> %d,cost = %d \n",r,i,vertexlist[i].weight);
	}
    }



    printf("\n The Paths are: \n");
    for(i=0;i<n;i++)
    {
	if(i!=r)
	{
	     l=i; //destination vertex
	     while(l!=r && vertexlist[l].parent != NIL) //backtracking till it reaches the start vertex.
             {

	   	  printf("%d -> ",l);
	   	  l=vertexlist[l].parent;
	     }
	     printf("%d",r);
	     printf("\n");
	}
     }


    return 0;
}

void dijkstra(info *vertexlist,alist **adjlist,int n,int r)
{
    int index,heapsize,i;
    info u;
    alist *v;
    vertexlist[r].weight=0; //starting vertex distance is assigned to zero.

    buildminheap(vertexlist,n); //builds the trivial minheap.
    heapsize=n;

    while(heapsize!=1) //until queue is empty
    {
        u=extractmin(vertexlist,heapsize);
	//u.flag=0;
        heapsize--;
        index=u.vertex; //tracks the position of 'u' in the adjacency list.

        v=adjlist[index];

        while(v!=NULL)
        {
            for(i=0;i<heapsize;i++)
            {
		if(vertexlist[i].weight > (vertexlist[index].weight + v->weight))
		{
		    vertexlist[i].weight = (vertexlist[index].weight + v->weight);
		    vertexlist[i].parent=index; //we change the parent of 'u' to parent of 'v'
		}

            }
            v=v->next;
        }
    }
    //return 0;
}

info extractmin(info *A,int heapsize)
{
    info u;
    int a;
    u=A[0]; //initially we assume root element is the minimum.
    if(heapsize!=1)
    {
        A[0]=A[(heapsize-1)]; //we swap the last node with root node.
        A[(heapsize-1)]=u;

        heapsize=heapsize-1;

        minheapify(A,heapsize,1); //we restore the balance.
    }
    return u; //we return the minimum element.
}

void heapdecreasekey(info *A,int w,int i)
{
    int j;
    info t;
    j = (i-1)/2;
    A[i].weight=w;
    while((i>0) && A[(i-1)/2].weight>A[i].weight)
    {
        t=A[i];
        A[i]=A[(i-1)/2];
        A[(i-1)/2] = t;
        i= (i-1)/2;
    }
}

void buildminheap(info *A, int heapsize) //builds the minheap for the first time.
{
    int i;
    for(i=(heapsize-1)/2;i>=0;i--)
    {
        minheapify(A,heapsize,i);
    }
}

void minheapify(info *A,int heapsize,int index) //restores balance lost due to extractmin.
{
    info temp;
    int left,right,smallest;
    left = (2*index)+1;
    right = (2*index)+2;
    if((left<heapsize) && (A[index].weight>A[left].weight))
    {
        smallest=left;
    }
    else
        smallest=index;

    if((right<heapsize) && (A[smallest].weight>A[right].weight))
    {
        smallest=right;
    }

    if(smallest!=index)
    {
        temp=A[smallest];
        A[smallest] = A[index];
        A[index]=temp;
        minheapify(A,heapsize,smallest);
    }
}
```

### Data File [Here](dijkstra.txt)