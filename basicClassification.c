#include <stdio.h>
int factorial(int a);

int isPrime(int a)
{
    if(a==1) return 1;
    int counter=2;
    while(counter!=a)
    {
        if(a%counter==0) return 0;
        counter=counter+1;       
    }
    return 1;
}

int isStrong(int a)
{
    int holder=a;
    int sum=0;
    while(a!=0)
    {
        sum=sum+factorial(a%10);
        a=a/10;
    }
    if(sum==holder) return 1;
    return 0;
} 

int factorial(int a)// calculates a!
{
    int mul=1;
    for(int i=a;i>0;i--)
    {
        mul=mul*i;
    }
    return mul;
}

