#include <stdio.h>
#include "NumClass.h"

int main()
{
    //printf("Enter 2 numbers \n");
    int num1,num2;
    int max,min=0;
    int inputchecker=0;
    inputchecker = scanf("%d %d",&num1,&num2);
    if(inputchecker!=2)
    {
      printf("Invalid Input!\n");
      return 0;
    }
    if(num1>=num2)
    {
         max=num1;
         min=num2;
    }
    else
    {
         max=num2;
         min=num1;
    }
    printf("The Armstrong numbers are:");
    for(int i=min;i<=max;i++)
    {
       if(isArmstrong(i)) printf(" %d",i);
    }
    printf("\n");
    printf("The Palindromes are:");
    for(int i=min;i<=max;i++)
    {
       if(isPalindrome(i)) printf(" %d",i);
    }
    printf("\n");
    printf("The Prime numbers are:");
    for(int i=min;i<=max;i++)
    {
       if(isPrime(i)) printf(" %d",i);
    }
    printf("\n");
    printf("The Strong numbers are:");
    for(int i=min;i<=max;i++)
    {
       if(isStrong(i)) printf(" %d",i);
    }
    printf("\n");
    return 0;
}