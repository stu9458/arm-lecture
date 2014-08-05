/*
2014/08/05 add comment
The fibonacci be solved by math.
Use the math can compute a number for protect the error of int type(65536).
pow(((1+(pow(5,1/2)))/2,n)  that's bigest in the formula.
If you need to know,please the hackpad.
https://emp-learn.hackpad.com/
*/
#include <stdio.h>

extern int fibonacci(int x);

int main(int argc, char **argv)
{
  int number=0;
  int result=0;

  printf("Please input a number(0~23):");//bigest in formala
  scanf("%d",&number);
   if(number>23)
	printf("Error!!");
   else{
	result = fibonacci(number);   
  	printf("The fibonacci sequence at %d is: %d\n", number, result);}
  return 0;
}
