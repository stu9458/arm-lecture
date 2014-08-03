/******************************
2014/07/31 2014-Embedded homework.
The Code use 2 register be local value.
R0 = Is "x" of C-code, be total num and index(input number)
R4 = use to store index(input num) fo R0
R5 = Store R0's value and add to R0 when R0 return value.
LR = R14. Link Register used to save the PC when entering a subroutine.

Push the old value and compute new state.
If x=0 or x=1 that will pop and compute.
Finall return to C-Code to user.

By Emp 2014/08/01
********************************/
	.syntax unified
	.arch armv7-a
	.text
	.align 2
	.thumb
	.thumb_func

	.global fibonacci
	.type fibonacci, function

fibonacci:
	@ ADD/MODIFY CODE BELOW
	@ PROLOG
	push {r4, r5, lr} //The function use 2 values. LR is R14
	
	mov r4,r0 //R0 is input and sum. Save R4 to R0
	cmp r4,#0  //if(R4==0)
	ble .L3	  //Jump to .L3

	cmp r4,#1  //if(R4==1)
	bqe .L4	   //Jump to .L4

        //R4 were store the input number. Let R0 be sum number.
        //return fib(x-1)
	subs r0,r4,#1
	bl fibonacci 

	mov r5,r0 //The R5 were store R0 number.
	sub r0,r4,#2
	bl fibonacci  

	@ R0 = R5 + R0 (update flags)
	add r0,r0,r5 //return fib(x-1)+fib(x-2)
	pop {r4, r5, pc}		@EPILOG

	@ END CODE MODIFICATION
.L3:
	//if(x==0)return 0
	mov r0, #0			@ R0 = 0
	pop {r4, r5, pc}		@ EPILOG

.L4:
	//if(x==1)return 1
	mov r0, #1			@ R0 = 1
	pop {r4, r5, pc}		@ EPILOG
	
	.size fibonacci, .-fibonacci
	.end
