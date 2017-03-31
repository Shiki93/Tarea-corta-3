;Assembly language program to find sum   SUMPROG.ASM
;
;         Objective: To add two integers.
;            Inputs: Two integers.
;            Output: Sum of input numbers.
%include  "io.mac"

.DATA
prompt1_msg  db  'Enter first number: ',0
prompt2_msg  db  'Enter second number: ',0
sum_msg      db  'Sum is: ',0
error_msg    db  'Overflow has occurred!',0
 
.UDATA
number1      resd  1        ; stores first number
number2      resd  1        ; stores first number
sum          resd  1        ; stores sum
final		 resd  1
 
.CODE
      .STARTUP
      ; prompt user for first number
      PutStr  prompt1_msg
      GetLInt [number1]
      
      ; prompt user for second number
      PutStr  prompt2_msg
      GetLInt [number2]
      
      ; find sum of two 32-bit numbers
      mov     EAX,[number1]
      add     EAX,[number2]
      mov     [sum],EAX
       
      ; check for overflow
      jno     no_overflow
      PutStr  error_msg
      nwln
      jmp     done
 
      ; display sum
no_overflow:
      PutStr  sum_msg
      PutLInt [sum]
      nwln
done:
;Aqui empiezo yo
	mov EAX, prompt1_msg
ciclo:
	mov dl, [EAX]
	cmp EAX, final
	je Salir
	call ConvBinario
	inc EAX
	jmp ciclo
Salir:

      .EXIT

;Imprime el caracter a evaluer en binario
ConvBinario:
	mov CX, 8
Siguiente:
	rcl dl, 1
	jc Uno
	PutCh '0'
	loop Siguiente
	jmp salirc
Uno:
	PutCh '1'
	loop Siguiente
salirc:
	PutCh ' '
	ret
