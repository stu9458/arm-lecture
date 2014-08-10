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
	push {r4, r5, r14} //The function use 2 values. LR is R14
	
	subs r4,r0,#0 //r4=r0-0,as cmp,but that save the result at dst.
	ble .L3	  //Jump to .L3

	cmp r4,#1  //if(R4==1),don't need result.
	beq .L4	   //Jump to .L4

        //R4 were store the input number. Let R0 be sum number.
        //return fib(x-1)
	sub r0,r4,#1
	bl fibonacci 
	
	//store R5 from r0.
	mov r5,r0 //The R5 were store R0 number.

	//Do fib(x-2). Let r0=r4-2 and return
	sub r0,r4,#2  //r0=r4-2
	bl fibonacci  

	//r0+=r5 and pop to last level.
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
