#include <stdio.h>
int power(int a,int b);

int isArmstrong(int a) 
{
    int holder=a;
    int temp=0;
    int sum=0;
    int digNum=0;
    int lastdig;
    while(a!=0)
    {
        digNum=digNum+1;
        a=a/10;
    }
    a=holder;
    while(a!=0)
    {
        lastdig=a%10;
        temp=power(lastdig, digNum);
        sum=sum+temp;
        a=a/10;
    }    
    if(sum==holder) return 1;
    return 0;
}

int isPalindrome(int a)
{
    int holder=a;
    int lastdig=0;
    int rev=0;
    while (a != 0) 
    {
        lastdig = a % 10;
        rev = rev * 10 + lastdig;
        a =a/10;
    }
  if(rev==holder) return 1;
    return 0;
}

int power(int a, int b)
{
    int pow=1;
    for(int i=0; i<b; i++)
    {
        pow=pow*a;
    }
    return pow;
}
