#include <stdio.h>
#include <math.h>
int rev(int a, int tmp);
int Check_Armstrong (int a, int dignum);

int isArmstrong(int a) 
{
    int holder=a;
    
    int sum=0;
    int digNum=0;
    while(a!=0)
    {
        digNum=digNum+1;
        a=a/10;
    }
	a=holder;
    sum= Check_Armstrong(a,digNum);
	if(sum==a) return 1;
	return 0;
}

int isPalindrome(int a)
{
    int revnum= rev(a,0);
    if(a==revnum) return 1;
    return 0;
}

int rev(int a, int tmp)//recursive func-returns reversed number
{
    if (a == 0) return tmp;       
    tmp = (tmp * 10) + (a % 10);
    return rev(a / 10, tmp);
}

int Check_Armstrong (int a, int dn)//recursive func- returns the sum of the pows
{
    if(a>0) return (pow(a%10,dn) +Check_Armstrong(a/10,dn));
	return 0;
}