//In this program the user will be asked to enter data for two list i.e sublist and main list and the program checks if the smaller list is sublist of main list or not. 


#include<stdio.h>
#include<stdlib.h>
struct node
{
  int data;
  struct node*next;  
};
void check(struct node**st1,struct node**st2)   //function to check if first list is sublist of second list or not 
{
    struct node* temp1=*st1;     // pointer1 to traverse sublist  
    struct node* temp2=*st2; //pointer2 to traverse list 
     struct node* temp3=*st2; // tail pointer to list pointer,this helps if last element of sublist and list is same
    
while(temp1!=NULL)     //untill the sublist is empty
{
    if(temp2->data==temp1->data)  
{  temp1=temp1->next;
   temp3=temp2;
   temp2=temp2->next;
}
else
{
    temp1= *st1;     //moving pointer 1 to start of sublist 
    temp3=temp2;        
    temp2=temp2->next;
    
}
}
if(temp3!=NULL)   
{
    printf("Sublist found");

}
else   //if sublist ends and list has yet not reached end
{
    printf("Sublist not found"); 
}

}
void create(struct node**st) // function to create list
{
    int n;
    struct node*temp;
    struct node *new=(struct node*)malloc(sizeof(struct node));
    printf("enter element\n");                  
    scanf("%d",&n);
    new->data=n;              //entering data for list
    new->next=NULL;
    if((*st)==NULL)    //if list is empty
       (*st)=new;
    else
    {
        temp=*st;
        while(temp->next!=NULL)
        {
            temp=temp->next;
        }
        temp->next=new;
    }
}

int main()
{
    int num1,num2;    
    struct node*start1=NULL;    //for sublist
    struct node*start2=NULL;    //for list 
    int ch,n;
   
printf("enter size of node to be created for sublist");
scanf("%d",&num1);
for(int i=0;i<num1;i++)
{
    create(&start1); //adding nodes in sublist
    
}
printf("enter the size of node to be created for list");
scanf("%d",&num2);
for(int i=0;i<num2;i++)
{
    create(&start2);   //adding nodes in list
   
}
check(&start1,&start2); //calling function to check if smaller list is sublist of list

return 0;
}
